#!/usr/bin/awk -f

BEGIN{
    # set input and output field separators
    FS=":"
    OFS=":"
    counter=0
}
{
    # set field 2 to nothing (removes "x")
    $2=""
    print $0
    counter++
}
END {
    print "There are " counter " accounts.\n"
}