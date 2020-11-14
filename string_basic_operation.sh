#!/bin/bash

BUFFETT="Life is like a snowball. The important thing is finding wet snow and a really long hill."
ISAY=$BUFFETT

echo "$BUFFETT"
#replace 1rst occurrence of 'snow' with 'foot'
ISAY=${BUFFETT[*]/snow/foot}
echo "1: $ISAY"

#delete the second occurrence of 'snow'
ISAY=${ISAY[*]//snow }
echo "2: $ISAY"

##replace 'finding' with 'getting'
ISAY=${ISAY[*]/finding/getting}
echo "3: $ISAY"

##delete all characters following 'wet'
loc=$(expr index "$ISAY" 'w')
ISAY=${ISAY::loc}
echo "end: $ISAY"
