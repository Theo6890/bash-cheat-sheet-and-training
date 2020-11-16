# RegEx cheatsheet
##How to write
***/*** (start), ***regEx***, ***/gi*** (global insensitive)<br>
ex: 
 - `/b\w{2,3}/gi`: matches any word containing a **b** with 2 others letters and cut the word at 3 other letter (+insensitive & global)
 - `b(a|e|i)d`: starts with b end with d & contains a or e or i
 
## Char classes
`.` any character except newline
`\w\d\s` word, digit, whitespace
`\W\D\S` not word, digit, whitespace
`[abc]` any of a, b, or c
`[^abc]` not a, b, or c
`[a-g]` character between a & g

## Anchors
`^abc$` start/end of the string
`\b\B` word, not-word boundary

## Escaped chars
`\.\*\\` escaped special characters
`\t\n\r` tab, linefeed, carriage return

## Groups & lookaround
`(abc)` capture group
`\1` backreference to group #1
`(?:abc)` non-capturing group
`(?=abc)` positive lookahead
`(?!abc)` negative lookahead

## Quantifiers & Alternation
`a*a+a?` 0 or more, 1 or more, 0 or 1
`a{5}a{2,}` exactly five, two or more
`a{1,3}` between one & three
`a+?a{2,}?`	match as few as possible
`ab|cd` match ab or cd