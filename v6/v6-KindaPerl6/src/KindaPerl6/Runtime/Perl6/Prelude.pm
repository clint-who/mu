class GLOBAL {

    sub say {
        print( |@_, "\n" );
    }

    sub all {
        Junction.new( things => @_, type => 'all' );
    };
    sub any {
        Junction.new( things => @_, type => 'any' );
    };
    sub none {
        Junction.new( things => @_, type => 'none' );
    };
    sub one {
        Junction.new( things => @_, type => 'one' );
    };
    sub infix:<|>($a,$b) {
        any($a,$b);
    };
    sub infix:<&>($a,$b) {
        all($a,$b);
    };
    sub infix:<^>($a,$b) {
        one($a,$b);
    };
    sub infix:<..>($from,$to) {
        Range.new( start => $from, end => $to );
    };
    sub infix:<&&>($left_thunk,$right_thunk) {
        my $left = $left_thunk.();
        if ($left) {
            $right_thunk.();
        } else {
            $left;
        }
    };
    sub infix:<||>($left_thunk,$right_thunk) {
        my $left = $left_thunk.();
        if ($left) {
            $left;
        } else {
            $right_thunk.();
        }
    };

    sub Inf { Math.Inf };
    sub NaN { Math.NaN };
    sub mkdir { IO.mkdir( @_ ) };
    sub rmdir { IO.rmdir( @_ ) };

    sub p5token($regex) { # XXX - this belongs to Runtime::Perl5
        #say 'p5token';
        sub ( $self, $str, $pos ) {
            #say 'sub returned by p5token';
            if (!(defined($str))) { $str = $_; };
            return match_p5rx($regex,$str,$pos);
        }
    }
}

=begin

=head1 AUTHORS

The Pugs Team E<lt>perl6-compiler@perl.orgE<gt>.

=head1 SEE ALSO

The Perl 6 homepage at L<http://dev.perl.org/perl6>.

The Pugs homepage at L<http://pugscode.org/>.

=head1 COPYRIGHT

Copyright 2007 by Flavio Soibelmann Glock and others.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

See L<http://www.perl.com/perl/misc/Artistic.html>

=end
