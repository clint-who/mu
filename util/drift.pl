#!/usr/bin/perl
use IPC::Open2;
use FindBin qw<$Bin>;

-e "$Bin/../../DrIFT/src/DrIFT.hs" or exit;

# XXX - This is not at all portable.

$ENV{DERIVEPATH} = "$Bin/../src";

my ($in, $out) = @ARGV or exit;

open TMP, "> $in.tmp" or die "Cannot open $out: $!";

open IN, $in or die $!;
while (<IN>) {
    if (/\{-!\s*global/) {
        print TMP $_;
        next;
    }
    /^(?:data)\b(?!.*\bwhere)/ .. /^$/ or next;
    s/--.*$//;
    /\S/ or next;
    print TMP $_;
}
close IN;
close TMP;

my ($rh, $wh);
my $pid = open2(
    $rh, $wh,
    'runghc',
    "-i$Bin/../src/DrIFT",
    "-i$Bin/../../DrIFT/src",
    "$Bin/../../DrIFT/src/DrIFT.hs",
    "$in.tmp"
);

my @program = do { <$rh> };
waitpid($pid, 0);
exit unless @program;

# Rearrange the DrIFT header
@program[0..2] = @program[2,0,1];
my @scary_header = split /^/m, << "SCARY";




{- 
-- WARNING WARNING WARNING --

This is an autogenerated file from $in.

Do not edit this file.

All changes made here will be lost!

-- WARNING WARNING WARNING --
-}











SCARY

# splice(@program, 2, 0, @scary_header);

open IN, $in or die $!;
open OUT, "> $out" or die $!;
while (<IN>) {
    /OPTION/ or last;
    print OUT $_;
}
print OUT @scary_header;
while (<IN>) { print OUT; }
close IN;

shift(@program) until $program[0] =~ /Look, but Don't Touch/;

print OUT @program;
close OUT;

unlink "$in.tmp";
