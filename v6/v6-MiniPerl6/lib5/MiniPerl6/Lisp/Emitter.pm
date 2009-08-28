# Do not edit this file - Generated by MiniPerl6
use v5;
use strict;
use MiniPerl6::Perl5::Runtime;
use MiniPerl6::Perl5::Match;
package MiniPerl6::Lisp::LexicalBlock;
sub new { shift; bless { @_ }, "MiniPerl6::Lisp::LexicalBlock" }
sub block { @_ == 1 ? ( $_[0]->{block} ) : ( $_[0]->{block} = $_[1] ) };
sub emit { my $self = shift; my $List__ = \@_; do { [] }; do { if (@{$self->{block}}) {  } else { return('nil') } }; (my  $str = ''); (my  $has_my_decl = 0); (my  $my_decl = ''); do { for my $decl ( @{$self->{block}} ) { do { if ((Main::isa($decl, 'Decl') && ($decl->decl() eq 'my'))) { ($has_my_decl = 1);($my_decl = ($my_decl . ('(' . ($decl->var()->emit() . ' (sv-undef))')))) } else {  } };do { if ((Main::isa($decl, 'Bind') && (Main::isa($decl->parameters(), 'Decl') && ($decl->parameters()->decl() eq 'my')))) { ($has_my_decl = 1);($my_decl = ($my_decl . ('(' . ($decl->parameters()->var()->emit() . ' (sv-undef))')))) } else {  } } } }; do { if ($has_my_decl) { ($str = ($str . ('(let (' . ($my_decl . ') ')))) } else { ($str = ($str . '(progn ')) } }; do { for my $decl ( @{$self->{block}} ) { do { if ((Main::isa($decl, 'Decl') && ($decl->decl() eq 'my'))) {  } else { ($str = ($str . $decl->emit())) } } } }; return(($str . ')')) }


;
package CompUnit;
sub new { shift; bless { @_ }, "CompUnit" }
sub name { @_ == 1 ? ( $_[0]->{name} ) : ( $_[0]->{name} = $_[1] ) };
sub attributes { @_ == 1 ? ( $_[0]->{attributes} ) : ( $_[0]->{attributes} = $_[1] ) };
sub methods { @_ == 1 ? ( $_[0]->{methods} ) : ( $_[0]->{methods} = $_[1] ) };
sub body { @_ == 1 ? ( $_[0]->{body} ) : ( $_[0]->{body} = $_[1] ) };
sub emit { my $self = shift; my $List__ = \@_; do { [] }; (my  $class_name = Main::to_lisp_namespace($self->{name})); (my  $str = (';; class ' . ($self->{name} . Main->newline()))); ($str = ($str . ('(defpackage ' . ($class_name . (Main->newline() . ('  (:use common-lisp mp-Main))' . (Main->newline() . (';; (in-package ' . ($class_name . (')' . Main->newline())))))))))); (my  $has_my_decl = 0); (my  $my_decl = ''); do { for my $decl ( @{$self->{body}} ) { do { if ((Main::isa($decl, 'Decl') && ($decl->decl() eq 'my'))) { ($has_my_decl = 1);($my_decl = ($my_decl . ('(' . ($decl->var()->emit() . ' (sv-undef))')))) } else {  } };do { if ((Main::isa($decl, 'Bind') && (Main::isa($decl->parameters(), 'Decl') && ($decl->parameters()->decl() eq 'my')))) { ($has_my_decl = 1);($my_decl = ($my_decl . ('(' . ($decl->parameters()->var()->emit() . ' (sv-undef))')))) } else {  } } } }; do { if ($has_my_decl) { ($str = ($str . ('(let (' . ($my_decl . (')' . Main->newline()))))) } else {  } }; ($str = ($str . ('(if (not (ignore-errors (find-class \'' . ($class_name . (')))
  (defclass ' . ($class_name . (' () ()))

(let (x) 
  (setq x (make-instance \'' . ($class_name . ('))
  (defun proto-' . ($class_name . ' () x))
')))))))))); (my  $dumper = ''); do { for my $decl ( @{$self->{body}} ) { do { if ((Main::isa($decl, 'Decl') && ($decl->decl() eq 'has'))) { (my  $accessor_name = $decl->var()->name());($dumper = ($dumper . ('(let ((m (make-instance \'mp-Pair))) ' . ('(setf (sv-key m) "' . (Main::lisp_escape_string($accessor_name) . ('") ' . ('(setf (sv-value m) (' . (Main::to_lisp_identifier($accessor_name) . ' self)) m) '))))))));($str = ($str . (';; has $.' . ($accessor_name . ('
(let ((new-slots (list (list :name \'' . (Main::to_lisp_identifier($accessor_name) . ('
  :readers \'(' . (Main::to_lisp_identifier($accessor_name) . (')
  :writers \'((setf ' . (Main::to_lisp_identifier($accessor_name) . ('))
  :initform \'(sv-undef)
  :initfunction (constantly (sv-undef))))))
(dolist (slot-defn (sb-mop:class-direct-slots (find-class \'' . ($class_name . (')))
(push (list :name (sb-mop:slot-definition-name slot-defn)
  :readers (sb-mop:slot-definition-readers slot-defn)
  :writers (sb-mop:slot-definition-writers slot-defn)
  :initform (sb-mop:slot-definition-initform slot-defn)
  :initfunction (sb-mop:slot-definition-initfunction slot-defn))
new-slots))
(sb-mop:ensure-class \'' . ($class_name . ' :direct-slots new-slots))

')))))))))))))) } else {  } };do { if (Main::isa($decl, 'Method')) { (my  $sig = $decl->sig());(my  $invocant = $sig->invocant());(my  $pos = $sig->positional());(my  $str_specific = ('(' . ($invocant->emit() . (' ' . ($class_name . ')')))));(my  $str_generic = $invocant->emit());(my  $str_optionals = '');do { for my $field ( @{$pos} ) { ($str_optionals = ($str_optionals . (' ' . $field->emit()))) } };do { if ($str_optionals) { ($str_specific = ($str_specific . (' &optional' . $str_optionals)));($str_generic = ($str_generic . (' &optional' . $str_optionals))) } else {  } };(my  $block = MiniPerl6::Lisp::LexicalBlock->new( 'block' => $decl->block(), ));($str = ($str . (';; method ' . ($decl->name() . ('
(if (not (ignore-errors (find-method \'' . (Main::to_lisp_identifier($decl->name()) . (' () ())))
  (defgeneric ' . (Main::to_lisp_identifier($decl->name()) . (' (' . ($str_generic . (')
      (:documentation ' . ('"' . ('a method' . ('"' . (')))
(defmethod ' . (Main::to_lisp_identifier($decl->name()) . (' (' . ($str_specific . (')
  (block mp6-function
    ' . ($block->emit() . '))

')))))))))))))))))))) } else {  } };do { if (Main::isa($decl, 'Sub')) { ($str = ($str . ('(in-package ' . ($class_name . (')' . (Main->newline() . ('  ' . ($decl->emit() . (Main->newline() . ('(in-package mp-Main)' . Main->newline())))))))))) } else {  } } } }; do { if (($self->{name} ne 'Pair')) { ($str = ($str . ('(defmethod sv-perl ((self ' . ($class_name . ('))' . (Main->newline() . ('  (mp-Main::sv-lisp_dump_object "::' . (Main::lisp_escape_string($self->{name}) . ('"' . (' (list ' . ($dumper . (')))' . (Main->newline() . Main->newline()))))))))))))) } else {  } }; do { for my $decl ( @{$self->{body}} ) { do { if ((((Main::isa($decl, 'Decl') && (($decl->decl() eq 'has') || ($decl->decl() eq 'my'))) ? 0 : 1) && ((Main::isa($decl, 'Method') ? 0 : 1) && (Main::isa($decl, 'Sub') ? 0 : 1)))) { ($str = ($str . ($decl->emit() . Main->newline()))) } else {  } } } }; do { if ($has_my_decl) { ($str = ($str . ')')) } else {  } }; ($str = ($str . (Main->newline() . Main->newline()))) }


;
package Val::Int;
sub new { shift; bless { @_ }, "Val::Int" }
sub int { @_ == 1 ? ( $_[0]->{int} ) : ( $_[0]->{int} = $_[1] ) };
sub emit { my $self = shift; my $List__ = \@_; do { [] }; $self->{int} }


;
package Val::Bit;
sub new { shift; bless { @_ }, "Val::Bit" }
sub bit { @_ == 1 ? ( $_[0]->{bit} ) : ( $_[0]->{bit} = $_[1] ) };
sub emit { my $self = shift; my $List__ = \@_; do { [] }; $self->{bit} }


;
package Val::Num;
sub new { shift; bless { @_ }, "Val::Num" }
sub num { @_ == 1 ? ( $_[0]->{num} ) : ( $_[0]->{num} = $_[1] ) };
sub emit { my $self = shift; my $List__ = \@_; do { [] }; $self->{num} }


;
package Val::Buf;
sub new { shift; bless { @_ }, "Val::Buf" }
sub buf { @_ == 1 ? ( $_[0]->{buf} ) : ( $_[0]->{buf} = $_[1] ) };
sub emit { my $self = shift; my $List__ = \@_; do { [] }; ('"' . (Main::lisp_escape_string($self->{buf}) . '"')) }


;
package Val::Undef;
sub new { shift; bless { @_ }, "Val::Undef" }
sub emit { my $self = shift; my $List__ = \@_; do { [] }; '(sv-undef)' }


;
package Val::Object;
sub new { shift; bless { @_ }, "Val::Object" }
sub class { @_ == 1 ? ( $_[0]->{class} ) : ( $_[0]->{class} = $_[1] ) };
sub fields { @_ == 1 ? ( $_[0]->{fields} ) : ( $_[0]->{fields} = $_[1] ) };
sub emit { my $self = shift; my $List__ = \@_; do { [] }; ('bless(' . (Main::perl($self->{fields}, ) . (', ' . (Main::perl($self->{class}, ) . ')')))) }


;
package Lit::Seq;
sub new { shift; bless { @_ }, "Lit::Seq" }
sub seq { @_ == 1 ? ( $_[0]->{seq} ) : ( $_[0]->{seq} = $_[1] ) };
sub emit { my $self = shift; my $List__ = \@_; do { [] }; ('(' . (Main::join([ map { $_->emit() } @{ $self->{seq} } ], ' ') . ')')) }


;
package Lit::Array;
sub new { shift; bless { @_ }, "Lit::Array" }
sub array { @_ == 1 ? ( $_[0]->{array} ) : ( $_[0]->{array} = $_[1] ) };
sub emit { my $self = shift; my $List__ = \@_; do { [] }; do { if (@{$self->{array}}) { (my  $str = '');do { for my $elem ( @{$self->{array}} ) { do { if ((Main::isa($elem, 'Apply') && ($elem->code() eq 'prefix:<@>'))) { ($str = ($str . (' ' . $elem->emit()))) } else { ($str = ($str . (' (list ' . ($elem->emit() . ')')))) } } } };return(('(concatenate \'list ' . ($str . ')'))) } else { return('nil') } } }


;
package Lit::Hash;
sub new { shift; bless { @_ }, "Lit::Hash" }
sub hash { @_ == 1 ? ( $_[0]->{hash} ) : ( $_[0]->{hash} = $_[1] ) };
sub emit { my $self = shift; my $List__ = \@_; do { [] }; do { if (@{$self->{hash}}) { (my  $fields = $self->{hash});(my  $str = '');do { for my $field ( @{$fields} ) { ($str = ($str . ('(setf (gethash ' . ($field->[0]->emit() . (' h) ' . ($field->[1]->emit() . ')')))))) } };return(('(let ((h (make-hash-table :test \'equal))) ' . ($str . ' h)'))) } else { return('(make-hash-table :test \'equal)') } } }


;
package Lit::Code;
sub new { shift; bless { @_ }, "Lit::Code" }
1


;
package Lit::Object;
sub new { shift; bless { @_ }, "Lit::Object" }
sub class { @_ == 1 ? ( $_[0]->{class} ) : ( $_[0]->{class} = $_[1] ) };
sub fields { @_ == 1 ? ( $_[0]->{fields} ) : ( $_[0]->{fields} = $_[1] ) };
sub emit { my $self = shift; my $List__ = \@_; do { [] }; do { if (@{$self->{fields}}) { (my  $fields = $self->{fields});(my  $str = '');do { for my $field ( @{$fields} ) { ($str = ($str . ('(setf (' . (Main::to_lisp_identifier($field->[0]->buf()) . (' m) ' . ($field->[1]->emit() . ')')))))) } };('(let ((m (make-instance \'' . (Main::to_lisp_namespace($self->{class}) . ('))) ' . ($str . ' m)')))) } else { return(('(make-instance \'' . (Main::to_lisp_namespace($self->{class}) . ')'))) } } }


;
package Index;
sub new { shift; bless { @_ }, "Index" }
sub obj { @_ == 1 ? ( $_[0]->{obj} ) : ( $_[0]->{obj} = $_[1] ) };
sub index_exp { @_ == 1 ? ( $_[0]->{index_exp} ) : ( $_[0]->{index_exp} = $_[1] ) };
sub emit { my $self = shift; my $List__ = \@_; do { [] }; return(('(elt ' . ($self->{obj}->emit() . (' ' . ($self->{index_exp}->emit() . ')'))))) }


;
package Lookup;
sub new { shift; bless { @_ }, "Lookup" }
sub obj { @_ == 1 ? ( $_[0]->{obj} ) : ( $_[0]->{obj} = $_[1] ) };
sub index_exp { @_ == 1 ? ( $_[0]->{index_exp} ) : ( $_[0]->{index_exp} = $_[1] ) };
sub emit { my $self = shift; my $List__ = \@_; do { [] }; do { if (Main::isa($self->{obj}, 'Var')) { do { if ((($self->{obj}->name() eq 'MATCH') || ($self->{obj}->name() eq '/'))) { return(('(gethash ' . ($self->{index_exp}->emit() . (' (sv-hash ' . ($self->{obj}->emit() . '))'))))) } else {  } } } else {  } }; return(('(gethash ' . ($self->{index_exp}->emit() . (' ' . ($self->{obj}->emit() . ')'))))) }


;
package Var;
sub new { shift; bless { @_ }, "Var" }
sub sigil { @_ == 1 ? ( $_[0]->{sigil} ) : ( $_[0]->{sigil} = $_[1] ) };
sub twigil { @_ == 1 ? ( $_[0]->{twigil} ) : ( $_[0]->{twigil} = $_[1] ) };
sub namespace { @_ == 1 ? ( $_[0]->{namespace} ) : ( $_[0]->{namespace} = $_[1] ) };
sub name { @_ == 1 ? ( $_[0]->{name} ) : ( $_[0]->{name} = $_[1] ) };
sub emit { my $self = shift; my $List__ = \@_; do { [] }; (my  $ns = ''); do { if ($self->{namespace}) { ($ns = (Main::to_lisp_namespace($self->{namespace}) . '::')) } else {  } }; (($self->{twigil} eq '.') ? ('(' . (Main::to_lisp_identifier($self->{name}) . ' sv-self)')) : (($self->{name} eq '/') ? Main::to_lisp_identifier('MATCH') : ($ns . Main::to_lisp_identifier($self->{name})))) }


;
package Bind;
sub new { shift; bless { @_ }, "Bind" }
sub parameters { @_ == 1 ? ( $_[0]->{parameters} ) : ( $_[0]->{parameters} = $_[1] ) };
sub arguments { @_ == 1 ? ( $_[0]->{arguments} ) : ( $_[0]->{arguments} = $_[1] ) };
sub emit { my $self = shift; my $List__ = \@_; do { [] }; do { if (Main::isa($self->{parameters}, 'Lit::Object')) { (my  $class = $self->{parameters}->class());(my  $a = $self->{parameters}->fields());(my  $b = $self->{arguments});(my  $str = 'do { ');(my  $i = 0);my  $arg;do { for my $var ( @{$a} ) { (my  $bind = Bind->new( 'parameters' => $var->[1],'arguments' => Call->new( 'invocant' => $b,'method' => $var->[0]->buf(),'arguments' => [],'hyper' => 0, ), ));($str = ($str . (' ' . ($bind->emit() . ' '))));($i = ($i + 1)) } };return(($str . ($self->{parameters}->emit() . ' }'))) } else {  } }; do { if ((Main::isa($self->{parameters}, 'Decl') && ($self->{parameters}->decl() eq 'my'))) { return(('(setf ' . ($self->{parameters}->var()->emit() . (' ' . ($self->{arguments}->emit() . ')'))))) } else {  } }; ('(setf ' . ($self->{parameters}->emit() . (' ' . ($self->{arguments}->emit() . ')')))) }


;
package Proto;
sub new { shift; bless { @_ }, "Proto" }
sub name { @_ == 1 ? ( $_[0]->{name} ) : ( $_[0]->{name} = $_[1] ) };
sub emit { my $self = shift; my $List__ = \@_; do { [] }; ('(proto-' . (Main::to_lisp_namespace($self->{name}) . ')')) }


;
package Call;
sub new { shift; bless { @_ }, "Call" }
sub invocant { @_ == 1 ? ( $_[0]->{invocant} ) : ( $_[0]->{invocant} = $_[1] ) };
sub hyper { @_ == 1 ? ( $_[0]->{hyper} ) : ( $_[0]->{hyper} = $_[1] ) };
sub method { @_ == 1 ? ( $_[0]->{method} ) : ( $_[0]->{method} = $_[1] ) };
sub arguments { @_ == 1 ? ( $_[0]->{arguments} ) : ( $_[0]->{arguments} = $_[1] ) };
sub emit { my $self = shift; my $List__ = \@_; do { [] }; (my  $arguments = ''); do { if (@{$self->{arguments}}) { ($arguments = Main::join([ map { $_->emit() } @{ $self->{arguments} } ], ' ')) } else {  } }; (my  $invocant = $self->{invocant}->emit()); do { if (($invocant eq 'self')) { ($invocant = 'sv-self') } else {  } }; do { if (($self->{method} eq 'values')) { do { if ($self->{hyper}) { die('not implemented') } else { return(('@{' . ($invocant . '}'))) } } } else {  } }; do { if (($self->{method} eq 'isa')) { do { if (($self->{arguments}->[0]->buf() eq 'Str')) { return(('(typep ' . ($invocant . ' \'string)'))) } else {  } };return(('(typep ' . ($invocant . (' \'' . (Main::to_lisp_namespace($self->{arguments}->[0]->buf()) . ')'))))) } else {  } }; do { if (($self->{method} eq 'chars')) { do { if ($self->{hyper}) { die('not implemented') } else { return(('(length ' . ($invocant . ')'))) } } } else {  } }; do { if ((($self->{method} eq 'yaml') || ($self->{method} eq 'say'))) { do { if ($self->{hyper}) { return(('[ map { ' . ($self->{method} . ('( $_, ' . (', ' . ($arguments . (')' . (' } @{ ' . ($invocant . ' } ]'))))))))) } else { return(('(' . ($self->{method} . (' ' . ($invocant . (' ' . ($arguments . ')'))))))) } } } else {  } }; (my  $meth = (Main::to_lisp_identifier($self->{method}) . ' ')); do { if (($self->{method} eq 'postcircumfix:<( )>')) { ($meth = '') } else {  } }; do { if ($self->{hyper}) { ('(mapcar #\'' . ($meth . ($invocant . ')'))) } else { return(('(' . ($meth . ($invocant . (' ' . ($arguments . ')')))))) } } }


;
package Apply;
sub new { shift; bless { @_ }, "Apply" }
sub code { @_ == 1 ? ( $_[0]->{code} ) : ( $_[0]->{code} = $_[1] ) };
sub arguments { @_ == 1 ? ( $_[0]->{arguments} ) : ( $_[0]->{arguments} = $_[1] ) };
sub namespace { @_ == 1 ? ( $_[0]->{namespace} ) : ( $_[0]->{namespace} = $_[1] ) };
sub emit { my $self = shift; my $List__ = \@_; do { [] }; (my  $ns = ''); do { if ($self->{namespace}) { ($ns = (Main::to_lisp_namespace($self->{namespace}) . '::')) } else {  } }; (my  $code = ($ns . $self->{code})); (my  $args = ''); do { if (@{$self->{arguments}}) { ($args = Main::join([ map { $_->emit() } @{ $self->{arguments} } ], ' ')) } else {  } }; do { if (($code eq 'self')) { return('sv-self') } else {  } }; do { if (($code eq 'false')) { return('nil') } else {  } }; do { if (($code eq 'make')) { return(('(return-from mp6-function ' . ($args . ')'))) } else {  } }; do { if (($code eq 'substr')) { return(('(sv-substr ' . ($args . ')'))) } else {  } }; do { if (($code eq 'say')) { return(('(mp-Main::sv-say (list ' . ($args . '))'))) } else {  } }; do { if (($code eq 'print')) { return(('(mp-Main::sv-print (list ' . ($args . '))'))) } else {  } }; do { if (($code eq 'infix:<~>')) { return(('(concatenate \'string (sv-string ' . ($self->{arguments}->[0]->emit() . (') (sv-string ' . ($self->{arguments}->[1]->emit() . '))'))))) } else {  } }; do { if (($code eq 'warn')) { return(('(write-line (format nil "~{~a~}" (list ' . ($args . ')) *error-output*)'))) } else {  } }; do { if (($code eq 'die')) { return(('(progn (write-line (format nil "~{~a~}" (list ' . ($args . ')) *error-output*) (sb-ext:quit))'))) } else {  } }; do { if (($code eq 'array')) { return($args) } else {  } }; do { if (($code eq 'prefix:<~>')) { return(('(sv-string ' . ($args . ')'))) } else {  } }; do { if (($code eq 'prefix:<!>')) { return(('(not (sv-bool ' . ($args . '))'))) } else {  } }; do { if (($code eq 'prefix:<?>')) { return(('(sv-bool ' . ($args . ')'))) } else {  } }; do { if (($code eq 'prefix:<$>')) { return(('(sv-scalar ' . ($args . ')'))) } else {  } }; do { if (($code eq 'prefix:<@>')) { return($args) } else {  } }; do { if (($code eq 'prefix:<%>')) { return($args) } else {  } }; do { if (($code eq 'infix:<+>')) { return(('(+ ' . ($args . ')'))) } else {  } }; do { if (($code eq 'infix:<->')) { return(('(-' . ($args . ')'))) } else {  } }; do { if (($code eq 'infix:<>>')) { return(('(> ' . ($args . ')'))) } else {  } }; do { if (($code eq 'infix:<&&>')) { return(('(sv-and ' . ($args . ')'))) } else {  } }; do { if (($code eq 'infix:<||>')) { return(('(sv-or ' . ($args . ')'))) } else {  } }; do { if (($code eq 'infix:<eq>')) { return(('(sv-eq ' . ($args . ')'))) } else {  } }; do { if (($code eq 'infix:<ne>')) { return(('(not (sv-eq ' . ($args . '))'))) } else {  } }; do { if (($code eq 'infix:<==>')) { return(('(eql ' . ($args . ')'))) } else {  } }; do { if (($code eq 'infix:<!=>')) { return(('(not (eql ' . ($args . '))'))) } else {  } }; do { if (($code eq 'ternary:<?? !!>')) { return(('(if (sv-bool ' . ($self->{arguments}->[0]->emit() . (') ' . ($self->{arguments}->[1]->emit() . (' ' . ($self->{arguments}->[2]->emit() . ')'))))))) } else {  } }; return(('(' . ($ns . (Main::to_lisp_identifier($self->{code}) . (' ' . ($args . ')')))))) }


;
package Return;
sub new { shift; bless { @_ }, "Return" }
sub result { @_ == 1 ? ( $_[0]->{result} ) : ( $_[0]->{result} = $_[1] ) };
sub emit { my $self = shift; my $List__ = \@_; do { [] }; return(('(return-from mp6-function ' . ($self->{result}->emit() . ')'))) }


;
package If;
sub new { shift; bless { @_ }, "If" }
sub cond { @_ == 1 ? ( $_[0]->{cond} ) : ( $_[0]->{cond} = $_[1] ) };
sub body { @_ == 1 ? ( $_[0]->{body} ) : ( $_[0]->{body} = $_[1] ) };
sub otherwise { @_ == 1 ? ( $_[0]->{otherwise} ) : ( $_[0]->{otherwise} = $_[1] ) };
sub emit { my $self = shift; my $List__ = \@_; do { [] }; (my  $block1 = MiniPerl6::Lisp::LexicalBlock->new( 'block' => $self->{body}, )); (my  $block2 = MiniPerl6::Lisp::LexicalBlock->new( 'block' => $self->{otherwise}, )); ('(if (sv-bool ' . ($self->{cond}->emit() . (') ' . ($block1->emit() . (' ' . ($block2->emit() . ')')))))) }


;
package For;
sub new { shift; bless { @_ }, "For" }
sub cond { @_ == 1 ? ( $_[0]->{cond} ) : ( $_[0]->{cond} = $_[1] ) };
sub body { @_ == 1 ? ( $_[0]->{body} ) : ( $_[0]->{body} = $_[1] ) };
sub topic { @_ == 1 ? ( $_[0]->{topic} ) : ( $_[0]->{topic} = $_[1] ) };
sub emit { my $self = shift; my $List__ = \@_; do { [] }; (my  $cond = $self->{cond}); (my  $block = MiniPerl6::Lisp::LexicalBlock->new( 'block' => $self->{body}, )); do { if ((Main::isa($cond, 'Var') && ($cond->sigil() eq '@'))) { ($cond = Apply->new( 'code' => 'prefix:<@>','arguments' => [$cond], )) } else {  } }; ('(dolist (' . ($self->{topic}->emit() . (' ' . ($cond->emit() . (') ' . ($block->emit() . ')')))))) }


;
package Decl;
sub new { shift; bless { @_ }, "Decl" }
sub decl { @_ == 1 ? ( $_[0]->{decl} ) : ( $_[0]->{decl} = $_[1] ) };
sub type { @_ == 1 ? ( $_[0]->{type} ) : ( $_[0]->{type} = $_[1] ) };
sub var { @_ == 1 ? ( $_[0]->{var} ) : ( $_[0]->{var} = $_[1] ) };
sub emit { my $self = shift; my $List__ = \@_; do { [] }; (my  $decl = $self->{decl}); (my  $name = $self->{var}->name()); (($decl eq 'has') ? ('sub ' . ($name . (' { ' . ('@_ == 1 ' . ('? ( $_[0]->{' . ($name . ('} ) ' . (': ( $_[0]->{' . ($name . ('} = $_[1] ) ' . '}')))))))))) : ($self->{decl} . (' ' . ($self->{type} . (' ' . $self->{var}->emit()))))) }


;
package Sig;
sub new { shift; bless { @_ }, "Sig" }
sub invocant { @_ == 1 ? ( $_[0]->{invocant} ) : ( $_[0]->{invocant} = $_[1] ) };
sub positional { @_ == 1 ? ( $_[0]->{positional} ) : ( $_[0]->{positional} = $_[1] ) };
sub named { @_ == 1 ? ( $_[0]->{named} ) : ( $_[0]->{named} = $_[1] ) };
sub emit { my $self = shift; my $List__ = \@_; do { [] }; ' print \'Signature - TODO\'; die \'Signature - TODO\'; ' }


;
package Method;
sub new { shift; bless { @_ }, "Method" }
sub name { @_ == 1 ? ( $_[0]->{name} ) : ( $_[0]->{name} = $_[1] ) };
sub sig { @_ == 1 ? ( $_[0]->{sig} ) : ( $_[0]->{sig} = $_[1] ) };
sub block { @_ == 1 ? ( $_[0]->{block} ) : ( $_[0]->{block} = $_[1] ) };
sub emit { my $self = shift; my $List__ = \@_; do { [] };  }


;
package Sub;
sub new { shift; bless { @_ }, "Sub" }
sub name { @_ == 1 ? ( $_[0]->{name} ) : ( $_[0]->{name} = $_[1] ) };
sub sig { @_ == 1 ? ( $_[0]->{sig} ) : ( $_[0]->{sig} = $_[1] ) };
sub block { @_ == 1 ? ( $_[0]->{block} ) : ( $_[0]->{block} = $_[1] ) };
sub emit { my $self = shift; my $List__ = \@_; do { [] }; (my  $sig = $self->{sig}); (my  $pos = $sig->positional()); (my  $block = MiniPerl6::Lisp::LexicalBlock->new( 'block' => $self->{block}, )); my  $str; do { if (@{$pos}) { do { for my $field ( @{$pos} ) { ($str = ($str . ($field->emit() . ' '))) } } } else {  } }; do { if ($str) { ($str = ('&optional ' . $str)) } else {  } }; do { if ($self->{name}) { ('(defun ' . (Main::to_lisp_identifier($self->{name}) . (' (' . ($str . (')' . (Main->newline() . ('  (block mp6-function ' . ($block->emit() . ('))' . Main->newline()))))))))) } else { ('(lambda ' . ($self->{name} . (' (' . ($str . (')' . (Main->newline() . ('  (block mp6-function ' . ($block->emit() . ('))' . Main->newline()))))))))) } } }


;
package Do;
sub new { shift; bless { @_ }, "Do" }
sub block { @_ == 1 ? ( $_[0]->{block} ) : ( $_[0]->{block} = $_[1] ) };
sub emit { my $self = shift; my $List__ = \@_; do { [] }; (my  $block = MiniPerl6::Lisp::LexicalBlock->new( 'block' => $self->{block}, )); return($block->emit()) }


;
package Use;
sub new { shift; bless { @_ }, "Use" }
sub mod { @_ == 1 ? ( $_[0]->{mod} ) : ( $_[0]->{mod} = $_[1] ) };
sub emit { my $self = shift; my $List__ = \@_; do { [] }; (Main->newline() . (';; use ' . (Main::to_lisp_namespace($self->{mod}) . Main->newline()))) }


;
1;
