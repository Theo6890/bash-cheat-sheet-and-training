# Shell: Cheat sheet

## Variable
Display: `echo "$var"`

## Condition
For:
 - `for; do...; done`
 - C/JS like: `for (( i = 0; i <  10; i++))`
 - Python like: `for i in {0..2}`
 
If:
 - C/JS like: `if (( $var == 0 )); then...; fi`
 - Normal: `if [[ $var -eq $var2 ]]; then...; fi`
 
## Array
 - Declare it: `a=()` or initialized it `a=(1 2 5 6 8 67)`
 - Get value at an index: `${a[0]}`
 - Get length: `${#a[@]}`
 - Add/get a value in following index in a loop: `tmp[${#tmp[@]}]=`
 - Get all values: `${z[*]}` or `${z[@]}`
 - Copy of array: `z=("${tmp[@]}")`
 
## Operation
 - Calculate: `$((i + 1))`