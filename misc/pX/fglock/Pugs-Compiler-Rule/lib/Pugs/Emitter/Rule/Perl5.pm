package Pugs::Emitter::Rule::Perl5;

use Pugs::Emitter::Rule::Perl5::Ratchet;

# p6-rule perl5 emitter

use strict;
use warnings;
use Data::Dumper;
$Data::Dumper::Indent = 1;

our $capture_count;
our $capture_to_array;
our %capture_seen;

sub call_subrule {
    my ( $subrule, $tab, $positionals, @param ) = @_;
    $subrule = "\$_[4]->" . $subrule unless $subrule =~ / :: | \. | -> /x;
    $subrule =~ s/\./->/;   # XXX - source filter

    $positionals = shift @param if $positionals eq '' && @param == 1;  # odd number of elements in hash
    #print "PARAM: ",Dumper(@param);

    return
"$tab sub{
$tab     my \$prior = \$::_V6_PRIOR_;
$tab     my \$param = { \%{ \$_[7] || {} }, positionals => [ $positionals ], args => {" .
            join(", ",@param) . "} };
$tab     \$_[3] = $subrule( \$_[0], \$param, \$_[3],  );
$tab     \$::_V6_PRIOR_ = \$prior;
$tab }
";
}

sub call_subrule_no_capture {
    my ( $subrule, $tab, $positionals, @param ) = @_;
    $subrule = "\$_[4]->" . $subrule unless $subrule =~ / :: | \. | -> /x;
    $subrule =~ s/\./->/;   # XXX - source filter

    $positionals = shift @param if $positionals eq '' && @param == 1;  # odd number of elements in hash
    #print "PARAM: ",Dumper(@param);

    return
"$tab sub{
$tab     my \$prior = \$::_V6_PRIOR_;
$tab     my \$param = { \%{ \$_[7] || {} }, positionals => [ $positionals ], args => {" .
            join(", ",@param) . "} };
$tab     \$_[3] = $subrule( \$_[0], \$param, \$_[3],  );
$tab     \$_[3]->data->{match} = [];
$tab     \$_[3]->data->{named} = {};
$tab     \$::_V6_PRIOR_ = \$prior;
$tab }
";
}

sub emit {
    my ($grammar, $ast) = @_;
    # runtime parameters: $grammar, $string, $state, $arg_list
    # rule parameters: see Runtime::Rule.pm
    local $capture_count = -1;
    local $capture_to_array = 0;
    local %capture_seen = ();
    #print "emit capture_to_array $capture_to_array\n";
    # print "emit: ", Dumper($ast);
    #die emit_rule( $ast, '    ' );

    return
"do {
  package Pugs::Runtime::Regex;
  my \$matcher = \n" . emit_rule( $ast, '    ' ) . ";
  my \$rule;
  \$rule = sub {" .
        # grammar, string, state, args
        #"    print \"match args: \",Dumper(\@_);\n" .
        "
    my \$tree;
    if (  defined \$_[3]{p}
       && ! \$_[3]{continue}
       ) {

      \$matcher->( \$_[1], \$_[2], \$tree, \$tree, \$_[0], \$_[3]{p}, \$_[1], \$_[3] );
      while ( defined \$tree && !\$tree && defined(\$tree->state) ) {
        \$matcher->( \$_[1], \$_[2], \$tree, \$tree, \$_[0], undef, \$_[1], \$_[3] );
      }

    }
    else {
      \$_[3]{p} ||= 0;
      for my \$pos ( \$_[3]{p} .. length( \$_[1] ) ) {
        my \$param = { \%{\$_[3]}, p => \$pos };

        \$matcher->( \$_[1], \$_[2], \$tree, \$tree, \$_[0], \$pos, \$_[1], \$param );
        while ( defined \$tree && !\$tree && defined(\$tree->state) ) {
          \$matcher->( \$_[1], \$_[2], \$tree, \$tree, \$_[0], undef, \$_[1], \$param );
        }

        last if \$tree;
      }
      \$tree = Pugs::Grammar::Base->no_match(\@_)
        unless defined \$tree;
    }
    my \$cap = \$tree->data->{capture};
    if ( ref \$cap eq 'CODE' ) {
      \$::_V6_MATCH_ = \$tree;
      \$tree->data->{capture} = \\(\$cap->( \$tree ));
    };
    if ( \$tree ) {
      # \$::_V6_PRIOR_ = \$rule

      my \$prior = \$::_V6_PRIOR_;
      \$::_V6_PRIOR_ = sub {
        local \$main::_V6_PRIOR_ = \$prior;
        \$rule->(\@_);
      };

    }
    return \$tree;
  }
}
";
}

sub emit_rule {
    my $n = $_[0];
    my $tab = $_[1] . '  ';
    die "unknown node: ", Dumper( $n )
        unless ref( $n ) eq 'HASH';
    #print "NODE ", Dumper($n);
    my @keys = grep { substr($_, 0, 1) ne '_' } keys %$n;
    my ($k) = @keys;
    my $v = $$n{$k};
    # XXX - use real references
    no strict 'refs';
    my $code = &$k( $v, $tab );
    return $code;
}

#rule nodes

sub capturing_group {
    my $program = $_[0];

    $capture_count++;
    {
        $capture_seen{$capture_count}++;
        local $capture_count = -1;
        local $capture_to_array = 0;
        local %capture_seen = ();
        $program = emit_rule( $program, $_[1].'      ' )
            if ref( $program );
    }

    return
        "$_[1] positional( $capture_count, " .
        ( $capture_to_array || ( $capture_seen{$capture_count} > 1 ? 1 : 0 ) ) .
        ", \n" .
        $program .
        "$_[1] )\n";
}
sub capture_as_result {
    my $program = $_[0];

    $capture_count++;
    {
        $capture_seen{$capture_count}++;
        local $capture_count = -1;
        local $capture_to_array = 0;
        local %capture_seen = ();
        $program = emit_rule( $program, $_[1].'      ' )
            if ref( $program );
    }

    return
        "$_[1] capture_as_result( \n" .
        $program .
        "$_[1] )\n";
}
sub non_capturing_group {
    return emit_rule( $_[0], $_[1] );
}
sub quant {
    my $term = $_[0]->{'term'};
    my $quantifier = $_[0]->{quant}  || '';
    my $greedy     = $_[0]->{greedy} || '';   # + ?

    if ( ref( $quantifier ) eq 'HASH' )
    {
        die "quantifier not implemented: " . Dumper( $quantifier );

        #return
        #    "$_[1] concat(\n" .
        #    join( ',', ($rul) x $count ) .
        #    "$_[1] )\n";
    }

    my $quant = $quantifier . $greedy;
    my $sub = {
            '*' =>'greedy_star',
            '+' =>'greedy_plus',
            '*?'=>'non_greedy_star',
            '+?'=>'non_greedy_plus',
            '?' =>'optional',
            '??'=>'null_or_optional',
            ''  => '',
        }->{$quant};
    die "quantifier not implemented: $quant"
        unless defined $sub;

    my $rul;
    {
        my $cap = $capture_to_array;
        local $capture_to_array = $cap || ( $quant ne '' ? 1 : 0 );
        $rul = emit_rule( $term, $_[1] . '  ' );
    }

    return $rul
        if $sub eq '';
    return
        "$_[1] $sub(\n" .
        $rul .
        "$_[1] )\n";
}
sub alt {
    my @s;
    # print "Alt: ", Dumper($_[0]);
    my $count = $capture_count;
    my $max = -1;
    for ( @{$_[0]} ) {
        $capture_count = $count;

        my $_capture_count      = $capture_count;
        my $_capture_to_array   = $capture_to_array;
        my %_capture_seen       = ( %capture_seen );
        local $capture_count    = $_capture_count;
        local $capture_to_array = $_capture_to_array;
        local %capture_seen     = ( %_capture_seen );

        my $tmp = emit_rule( $_, $_[1].'  ' );
        # print ' ',$capture_count;
        $max = $capture_count
            if $capture_count > $max;
        push @s, $tmp if $tmp;
    }
    $capture_count = $max;

    return "$_[1] alternation( [\n" .
           join( ',', @s ) .
           "$_[1] ] )\n";
}
sub alt1 { &alt }
sub concat {
    my @s;
    for ( @{$_[0]} ) {
        my $tmp = emit_rule( $_, $_[1] );
        push @s, $tmp if $tmp;
    }
    return
        "$_[1] concat( \n" .
        join( ',', @s ) .
        "$_[1] )\n";
}
sub code {
    return "$_[1] $_[0]\n";
}
sub dot {
    return call_subrule( 'any', $_[1], '' );
}
sub variable {
    my $name = "$_[0]";
    my $value = undef;
    # XXX - eval $name doesn't look up in user lexical pad
    # XXX - what &xxx interpolate to?

    if ( $name =~ /^\$/ ) {
        # $^a, $^b
        if ( $name =~ /^ \$ \^ ([^\s]*) /x ) {
            my $index = ord($1)-ord('a');
            #print "Variable #$index\n";
            #return "$_[1] constant( \$_[7][$index] )\n";

            my $code =
            "    sub {
                #print \"Runtime Variable args[\", join(\",\",\@_) ,\"] \$_[7][$index]\\n\";
                return constant( \$_[7][$index] )->(\@_);
            }";
            $code =~ s/^/$_[1]/mg;
            return "$code\n";
        }
        else {
            $value = eval $name;
        }
    }

    # ??? $value = join('', eval $name) if $name =~ /^\@/;

    if ( $name =~ /^%/ ) {
        # XXX - runtime or compile-time interpolation?
        return "$_[1] hash( \\$name )\n" if $name =~ /::/;
        return "$_[1] hash( get_variable( '$name' ) )\n";
    }
    die "interpolation of $name not implemented"
        unless defined $value;

    return "$_[1] constant( '" . $value . "' )\n";
}
sub special_char {
    my ($char, $data) = $_[0] =~ /^.(.)(.*)/;
    $_[1] = '' unless defined $_[1];

    return  "$_[1] perl5( '\\N{" . join( "}\\N{", split( /\s*;\s*/, $data ) ) . "}' )\n"
        if $char eq 'c';
    return  "$_[1] perl5( '(?!\\N{" . join( "}\\N{", split( /\s*;\s*/, $data ) ) . "})\\X' )\n"
        if $char eq 'C';

    return  "$_[1] perl5( '\\x{$data}' )\n"
        if $char eq 'x';
    return  "$_[1] perl5( '(?!\\x{$data})\\X' )\n"
        if $char eq 'X';

    return special_char( sprintf("\\x%X", oct($data) ) )
        if $char eq 'o';
    return special_char( sprintf("\\X%X", oct($data) ) )
        if $char eq 'O';

    return  "$_[1] perl5( '(?:\\n\\r?|\\r\\n?|\\x85|\\x{2028})' )\n"
        if $char eq 'n';
    return  "$_[1] perl5( '(?!\\n\\r?|\\r\\n?|\\x85|\\x{2028})\\X' )\n"
        if $char eq 'N';

    # XXX - Infinite loop in pugs stdrules.t
    #return metasyntax( '?_horizontal_ws', $_[1] )
    return "$_[1] perl5( '[\\x20\\x09]' )\n"
        if $char eq 'h';
    return "$_[1] perl5( '[^\\x20\\x09]' )\n"
        if $char eq 'H';
    #return metasyntax( '?_vertical_ws', $_[1] )
    return "$_[1] perl5( '[\\x0A\\x0D]' )\n"
        if $char eq 'v';
    return "$_[1] perl5( '[^\\x0A\\x0D]' )\n"
        if $char eq 'V';

    for ( qw( r n t e f w d s ) ) {
        return "$_[1] perl5( '\\$_' )\n" if $char eq $_;
        return "$_[1] perl5( '[^\\$_]' )\n" if $char eq uc($_);
    }
    $char = '\\\\' if $char eq '\\';
    return "$_[1] constant( q!$char! )\n" unless $char eq '!';
    return "$_[1] constant( q($char) )\n";
}
sub match_variable {
    my $name = $_[0];
    my $num = substr($name,1);
    #print "var name: ", $num, "\n";
    my $code =
    "    sub {
        my \$m = \$_[2];
        #print 'var: ',\$m->perl;
        #print 'var: ',\$m->[$num];
        return constant( \"\$m->[$num]\" )->(\@_);
    }";
    $code =~ s/^/$_[1]/mg;
    return "$code\n";
}
sub closure {
    my $code     = $_[0]{closure};
    my $modifier = $_[0]{modifier};  # 'plain', '', '?', '!'

    #die "closure modifier not implemented '$modifier'"
    #    unless $modifier eq 'plain';

    #warn "CODE $code";
    $code = '' if $code eq '{*}';  # "whatever"

    if (  ref( $code )
       && defined $Pugs::Compiler::Perl6::VERSION
    ) {
        # perl6 compiler is loaded
        $code = Pugs::Emitter::Perl6::Perl5::emit( 'grammar', $code, 'self' );
        $code = '{ my $_V6_SELF = shift; ' . $code . '}';  # make it a "method"
    }
    else {
        # XXX XXX XXX - source-filter - temporary hacks to translate p6 to p5
        # $()<name>
        $code =~ s/ ([^']) \$ \( \) < (.*?) > /$1 \$_[0]->[$2]/sgx;
        # $<name>
        $code =~ s/ ([^']) \$ < (.*?) > /$1 \$_[0]->{$2}/sgx;
        # $()
        $code =~ s/ ([^']) \$ \( \) /$1 \$_[0]->()/sgx;
        # $/
        $code =~ s/ ([^']) \$ \/ /$1 \$_[0]/sgx;
    }
    #print "Code: $code\n";

            return "
                sub {
                    \$_[3] = Pugs::Runtime::Match->new( {
                        bool  => \\1,
                        str   => \\(\$_[0]),
                        from  => \\(\$_[7]{p} || 0),
                        to    => \\(\$_[7]{p} || 0),
                        match => [],
                        named => {},
                        capture => sub { $code },
                        abort => 1,
                    } )
                }\n"
                if $code =~ /return/;

    my $bool = "\\\$::_V6_SUCCEED";
    $bool    = "\\( \$capture ? 1 : 0 )"  if $modifier eq '?';
    $bool    = "\\( \$capture ? 0 : 1 )"  if $modifier eq '!';

    my $cap  = "\\\$capture";
    $cap     = "undef"  if $modifier eq '?' || $modifier eq '!';

            return "
                sub {
                    \$::_V6_MATCH_ = \$_[0];
                    local \$::_V6_SUCCEED = 1;
                    my \$capture = sub { $code }->( \$_[3] );
                    \$_[3] = Pugs::Runtime::Match->new( {
                        bool  => $bool,
                        str   => \\(\$_[0]),
                        from  => \\(\$_[7]{p} || 0),
                        to    => \\(\$_[7]{p} || 0),
                        match => [],
                        named => {},
                        capture => undef,
                    } )
                }\n";

}
sub named_capture {
    my $name    = $_[0]{ident};
    $name = $name->{match_variable} if ref($name) eq 'HASH';
    $name =~ s/^[\$\@\%]//;  # TODO - change semantics as needed
    my $program = $_[0]{rule};
    $capture_seen{$name}++;
    return
        "$_[1] named( '$name', " .
        ( $capture_to_array || ( $capture_seen{$name} > 1 ? 1 : 0 ) ) .
        ", \n" .
        emit_rule($program, $_[1]) .
        "$_[1] )\n";
}
sub negate {
    my $program = $_[0];
    #print "Negate: ", Dumper($_[0]);
    return
        "$_[1] negate( \n" .
        emit_rule($program, $_[1]) .
        "$_[1] )\n";
}
sub before {
    my $program = $_[0]{rule};
    return
        "$_[1] before( \n" .
        emit_rule($program, $_[1]) .
        "$_[1] )\n";
}
sub colon {
    my $str = $_[0];
    return "$_[1] at_start() \n"
        if $str eq '^';
    return "$_[1] alternation( [ null(), failed_abort() ] ) \n"
        if $str eq ':';
    return "$_[1] at_end_of_string() \n"
        if $str eq '$';
    return "$_[1] at_line_start() \n"
        if $str eq '^^';
    return "$_[1] at_line_end() \n"
        if $str eq '$$';
    return metasyntax( '?_wb_left', $_[1] )
        if $str eq '<<';
    return metasyntax( '?_wb_right', $_[1] )
        if $str eq '>>';
    die "'$str' not implemented";
}
sub modifier {
    my $str = $_[0]{modifier};
    my $rule = $_[0]{rule};

    return "$_[1] ignorecase( \n"
        . emit_rule( $rule, $_[1] . '  ' )
        . " )\n"
        if $str eq 'ignorecase';

    die "modifier '$str' not implemented";
}
sub constant {
    my $char = $_[0] eq '\\' ? '\\\\' : $_[0];
    return "$_[1] constant( q!$char! )\n" unless $char =~ /!/;
    return "$_[1] constant( q($char) )\n";
}
sub char_class {
    my $cmd = Pugs::Emitter::Rule::Perl5::CharClass::emit( $_[0] );
    return "$_[1] perl5( q!$cmd! )\n" unless $cmd =~ /!/;
    return "$_[1] perl5( q($cmd) )\n"; # XXX if $cmd eq '!)'
}
sub call {
    #die "not implemented: ", Dumper(\@_);
    my $param = $_[0]{params};
    my $name = $_[0]{method};
        # capturing subrule
        # <subrule ( param, param ) >
        my ($param_list) = $param =~ /\{(.*)\}/;
        $param_list = '' unless defined $param_list;
        my @param = split( ',', $param_list );
        $capture_seen{$name}++;
        #print "subrule ", $capture_seen{$name}, "\n";
        #print "param: ", Dumper(\@param);
        return
            "$_[1] named( '$name', " .
            ( $capture_to_array || ( $capture_seen{$name} > 1 ? 1 : 0 ) ) .
            ", \n" .
            call_subrule( $name, $_[1]."  ", "", @param ) .
            "$_[1] )\n";
}
sub metasyntax {
    my $cmd = $_[0]{metasyntax};
    my $modifier = delete $_[0]{modifier} || '';   # ? !
    return negate( { metasyntax => $_[0] }, $_[1] ) if $modifier eq '!';

    my $prefix = substr( $cmd, 0, 1 );
    if ( $prefix eq '@' ) {
        # XXX - wrap @array items - see end of Pugs::Grammar::Rule
        return
            "$_[1] alternation( \\$cmd )\n";
    }

    if ( $prefix eq '%' ) {
        # XXX - runtime or compile-time interpolation?
        my $name = substr( $cmd, 1 );
        $capture_seen{$name}++;
        return "$_[1] named( '$name', " .
            ( $capture_to_array || ( $capture_seen{$name} > 1 ? 1 : 0 ) ) .
            ", hash( \\$cmd ) )\n"
            if $cmd =~ /::/;
        return "$_[1] named( '$name', " .
            ( $capture_to_array || ( $capture_seen{$name} > 1 ? 1 : 0 ) ) .
            ", hash( get_variable( '$cmd' ) ) )\n";
    }

    if ( $prefix eq '$' ) {
        if ( $cmd =~ /::/ ) {
            # call method in fully qualified $package::var
            return
            "$_[1] sub { \n" .
            # "$_[1]     print 'params: ',Dumper(\@_);\n" .
            "$_[1]     \$_[3] = $cmd->match( \$_[0], \$_[4], \$_[7], \$_[1] );\n" .
            "$_[1] }\n";
        }
        # call method in lexical $var
        return
            "$_[1] sub { \n" .
            #"$_[1]     print 'params: ',Dumper(\@_);\n" .
            "$_[1]     my \$r = get_variable( '$cmd' );\n" .
            "$_[1]     \$_[3] = \$r->match( \$_[0], \$_[4], \$_[7], \$_[1] );\n" .
            "$_[1] }\n";
    }
    if ( $prefix eq q(') ) {   # single quoted literal '
        $cmd = substr( $cmd, 1, -1 );
        return "$_[1] constant( q!$cmd! )\n" unless $cmd =~ /!/;
        return "$_[1] constant( q($cmd) )\n";
    }
    if ( $prefix eq q(") ) {   # interpolated literal "
        $cmd = substr( $cmd, 1, -1 );
        warn "<\"...\"> not implemented";
        return;
    }
    if ( $prefix eq '.' ) {   # non_capturing_subrule / code assertion
        $cmd = substr( $cmd, 1 );
        if ( $cmd =~ /^{/ ) {
            warn "code assertion not implemented";
            return;
        }
        return call_subrule_no_capture( $cmd, $_[1], '' );
    }
    if ( $prefix eq '?' ) {   # non_capturing_subrule / code assertion
        # XXX FIXME
        $cmd = substr( $cmd, 1 );
        if ( $cmd =~ /^{/ ) {
            warn "code assertion not implemented";
            return;
        }
        return call_subrule_no_capture( $cmd, $_[1], '' );
    }
    if ( $prefix =~ /[_[:alnum:]]/ ) {
        if ( $cmd eq 'cut' ) {
            warn "<$cmd> not implemented";
            return;
        }
        if ( $cmd eq 'commit' ) {
            warn "<$cmd> not implemented";
            return;
        }
        # capturing subrule
        # <subrule ( param, param ) >
        my ( $name, $param_list ) = split( /[\(\)]/, $cmd );
        $param_list = '' unless defined $param_list;
        my @param = split( ',', $param_list );
        $capture_seen{$name}++;
        #print "subrule ", $capture_seen{$name}, "\n";
        #print "param: ", Dumper(\@param);
        return
            "$_[1] named( '$name', " .
            ( $capture_to_array || ( $capture_seen{$name} > 1 ? 1 : 0 ) ) .
            ", \n" .
            call_subrule( $name, $_[1]."  ", "", @param ) .
            "$_[1] )\n";
    }
    #if ( $prefix eq '.' ) {
    #    my ( $method, $param_list ) = split( /[\(\)]/, $cmd );
    #    $method =~ s/^\.//;
    #    $param_list ||= '';
    #    return "$_[1] try_method( '$method', '$param_list' ) ";
    #}
    die "<$cmd> not implemented";
}

1;
