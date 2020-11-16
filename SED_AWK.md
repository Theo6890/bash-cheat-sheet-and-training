# Special Commands sed,awk,grep,sort
## Sed: stream editor 
Used to select/substitute txt, add/delete lines, modify/preserve original file. Useful for simple text parsing
### Select
Select some specific lines: `sed -n -e '1,4p' -e '31,34p' coleridge.txt`<br>
 - `-n` to print only lines NOT the whole file<br>
 - `-e`: multiple entries<br>
 - `1~5p`: prints every 5th line<br>
 - `'/^And/p'`: Prints lines starting by **and** (And, Android, Ancestral...) **case-sensitive**<br>
 - `'/^And /p'`: Prints lines strictly starting by **and**<br>
 - `pig`: `p` = paragraph, `i` = case-insensitive, `g`: global
### Substitute
Replace gonk by geek `echo howtogonk | sed 's/gonk/geek/'`<br>
Replace *2 space or more ("\*" effect)* by 1 space `sed -n '1,4 s/  */ /gp' coleridge.txt`<br>
 `/neck/c Around my`: replace ENTIRE line containing *neck* by *Around my*<br>
*Remark*:
 - *`/after/<PATTERN>`: after this pattern apply substitute with `s/....`*
 - *usage of RegEx possible*
### Insertion
`sed '/He/a --> Inserted!' geeks.txt`: If line contains *He* will insert *--> Inserted!* after<br>
*Remarks*
 - *`a`: after*
 - *`i`: before*
 - *`G`: blank line between each line, can be used just on its own: `sed 'G' geeks.txt`*
### Deletion 
Delete a range: `sed '4,5d' geeks.txt`<br>
Delete outside a range: `sed '6,7!d' geeks.txt`
### File modification
 - `-i`: save in file
 - redirect output into a file (`>`)
    
## Awk: full scripting language & sed like for more complex actions
Print arg 1 & 4 from `who`: `who | awk '{print $1,$4}'`

Output field separator: `date | awk 'OFS="/" {print$2,$3,$6}'`

BEGIN and END rule: action to do **before** or **after** the process
 - **Active Sessions** before result of `who`: `who | awk 'BEGIN {print "Active Sessions"} {print $1,$4}'`
 
Input field separator: tell which character in text as the field separator
 - `awk -F: '{print $1,$6}' /etc/passwd`
 
Filter a result: 
 - A field's result gt: `awk -F: '$3 >= 1000 {print $1,$6}' /etc/passwd`
 - Search a precise pattern (`^` restrict only to pattern): `awk '/^UUID/ {print $1}' /etc/fstab` 

Function and script:
examples
 - `awk 'BEGIN { print sqrt(625)}'`
 - `awk 'BEGIN { print sqrt((2+3)*5)}'`
 
For scripting see *(resume everything written above)*: `advanced/function_scripting.awk`<br>
*Remark: in `#!/bin/awk -f` the `-f` indicate info will be read from a file*
## Grep: quick filter pattern
## Sort: quick sorting command