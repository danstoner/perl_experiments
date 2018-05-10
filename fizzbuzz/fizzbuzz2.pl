foreach my $i (1..15) {
    if (!($i % 3)) { print "Fizz"; }
    if (!($i % 5)) { print "Buzz"; }
    if (! ((!($i % 3)) or (!($i % 5)))) { print $i; }
    print "\n" ;
}

