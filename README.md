# Shell: Cheat sheet

Learn shell [here](https://www.learnshell.org/)


# Basics
## Variable
Display: `echo "$var"`

## Decision making 
 - **If**
     - C/JS like: `if (( $var == 0 )); then...; fi`
     - Normal: `if [[ $var -eq $var2 ]]; then...; fi`
     - Is it in?:
        - `if [[ $VAR == *"Linux"* ]]`
        - `if [[ $VAR =~ .*Linux.* ]]`
 - **Switch:**<br>
    `case ... in`<br>
    `   ...) ... ;;`<br>
    `esac`
 - Is a string empty?: `-z`
 - Everything else is the same as other language using `(( ... ))`   

# Loop
 - For:
    - `for; do...; done`
    - C/JS like: `for (( i = 0; i <  10; i++))`
    - Python like: `for i in {0..2}`
 - While: running as long as condition is **true**
    - `while ... option; do ...; done`
 - Until: running as long as condition is **false**
    - `until ...; do ...; done`
 
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
see `basics/string_basic_operation.sh`
 
# Advanced

## Special variables
 - `$0` : filename
 - `$n`: Nth arg passed was invoked or function was called<br>
    *test it: if [ "$1" != "" ]*
 - `$#`: nbr of arg passed *(script or function)*<br>
    *there are arguments if > 0*
 - `$@` or `$*`: all args passed *(script or function)*<br>
    *can loop on it*
 - `$?`: exit status from last command executed
 - `$$`: process ID of shell *(shell scripts: process ID under which they are executing)*
 - `$!`: process nbr of last bg command
 
## Trap command
Catch special signal/interruption/user input in script to prevent the unpredictables `trap <arg/function> <signal>`<br>
ex: `trap "echo Booh!" SIGINT SIGTERM` --> on Crtl+C displays ***Booh!***

## File testing
 - File exists?: `if [ -e "$filename" ]`
 - Directory exists?: `if [ -d "$directory_name" ]`
 - Read permission?: `if [ ! -f "$filename" ]`

## Input Parameter Parsing
 - To get arguments see **Special Variables** section
 - Read option values: loop on `getops` function
    - ex: get value for `-u -a -l`<br>
    `while getopts u:a:l: option `<br>`
        do `<br>`
        case "${option}" in`<br>`
            u) USER=${OPTARG};;`<br>`
            a) AGE=${OPTARG};;`<br>`
            l) LOCATION=${OPTARG};;`<br>`
        esac`<br>`
     done` 

## Pipe(line)s
 - Counts nbr entries in directory: `ls / | wc -l`
 - Get 1rst 10 results: `ls / | head` *outputs the first 10 lines by default, use option -n to change* <br>
*Remark: By default pipelines redirects only the standard output, if you want to include the standard error you need 
to use the form |& which is a short hand for 2>&1 |* 

## Redirection ~= Process Substitution
 - Save sorted results to new files & show diffs between files:
    - without process subs:
    `sort file1 > sorted_file1`<br>
    `sort file2 > sorted_file2`<br>
    `diff sorted_file1 sorted_file2`
    - with: `diff <(sort file1) <(sort file2)`
 - Store logs app into file & print it in console: `echo "Hello, world!" | tee /tmp/hello.txt`
 - Only lower case in file but keep regular case on output: `echo "Hello, world!" | tee >(tr '[:upper:]' '[:lower:]' > /tmp/hello.txt)`