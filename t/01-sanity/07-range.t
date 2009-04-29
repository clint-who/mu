use v6;

# L<S04/Conditional statements>
# should be: L<S02/Lists/The C<< .. >> operator now constructs a>
# L<S02/Lists/functioning as an operator>

say "1..4";

my @array = (3..5);

if @array[0] == 3 { say "ok 1" } else { say "not ok 1" }
if @array[1] == 4 { say "ok 2" } else { say "not ok 2" }
if @array[2] == 5 { say "ok 3" } else { say "not ok 3" }
if +@array   == 3 { say "ok 4" } else { say "not ok 4" }
