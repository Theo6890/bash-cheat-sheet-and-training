# Shell: Cheat sheet

Learn shell [here](https://www.learnshell.org/)

## Variable
Display: `echo "$var"`

## Decision Making
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
 - Get all values: `${z[*]}` or `${z[@]}` (can be used in loop to retrieve values not index)
 - Copy of array: `z=("${tmp[@]}")`
 
## Operation
 - Calculate: `$((i + 1))`
 
## Functions
 - Declare a function: `function function_A {...}`
 - Get parameters & call a function is the same is calling a script and passing args 
   - Get parameters: 1rst param `$1`, 2nd param `$2`, ... 
   - call function: `function_A arg1 arg2`
   
## String
 - see string_basic_operation.sh