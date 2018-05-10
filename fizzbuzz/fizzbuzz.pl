foreach my $i (1..15) {
    if ($i % 3 == 0) { print "Fizz"; }
    if ($i % 5 == 0) { print "Buzz"; }
    if (! (($i % 3 == 0) or ($i % 5 == 0))) { print $i; }
    print "\n" ;
}

