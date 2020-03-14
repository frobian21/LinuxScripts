#LinuxScripts
##Shell scripting
#####Assign variables
```bash
foo=bar
echo "$foo" # prints bar
echo '$foo' # prints $foo as literal string
```
#####Special characters

- `$0` - Name of the script
- `$1` to `$9` - Arguments to the script. $1 is the first argument and so on.
- `$@` - All the arguments _should be quoted_
- `$*` - All the arguments as a single string; **must be quoted**
- `$#` - Number of arguments
- `$?` - Return code of the previous command
- `$$` - PID for the current script
- `$!` - PID of last job run in background
   * `possibly_hanging_job & { sleep ${TIMEOUT}; eval 'kill -9 $!' &> /dev/null; }`
- `!!` - Entire last command, including arguments. A common pattern is to execute a command only for it to fail due to missing permissions, then you can quickly execute it with sudo by doing sudo !!
- `$_` - Last argument from the last command
#####Control flow techniques
- `if`
- `case`
- `while`
- `for`
- etc
 ```bash
mcd () {
     mkdir -p "$1"
     cd "$1" # also can use $_
 }
```
#####Error codes
- Commands will often return output using STDOUT, errors through STDERR and a Return Code to report errors in a more script friendly manner
- exit codes to conditionally execute commands
```bash
false || echo "Oops, fail" # false returns 1 to STD:ERR
true || echo "Will not be printed" # true returns 0 to STD:ERR
true && echo "Things went well"
false && echo "Will not be printed"
false ; echo "This will always run"
```
#####Substitution
- Command substitution `$( CMD )`
  * `for file in $(ls)`
- Process substitution `<( CMD )`
  * `diff <(ls foo) <(ls bar)`
#####Globbing
- Wildcards `?` 
#####Test `[[]]`

- Expressions
  0. `( EXPRESSION )` -> EXPRESSION is true
  0. `! EXPRESSION` -> EXPRESSION is false
  0. `EXPRESSION1 && EXPRESSION2` -> both EXPRESSION1 **AND** EXPRESSION2 are true
  0. `EXPRESSION1 || EXPRESSION2` -> either EXPRESSION1 **OR** EXPRESSION2 is true
- Strings
  1. `-n STRING` -> the length of STRING is nonzero
  1. `-z STRING` -> the length of STRING is zero
  1. `STRING1 = STRING2` -> the strings are equal
  1. `STRING1 = PATTERN` -> the string matches pattern
  1. `STRING1 =~ REGEX` -> the string matches regex
  1. `STRING1 != STRING2` -> the strings are not equal
- Integers
  2. `INTEGER1 -eq INTEGER2` -> INTEGER1 is equal to INTEGER2
  2. `INTEGER1 -ge INTEGER2` -> INTEGER1 is greater than or equal to INTEGER2
  2. `INTEGER1 -gt INTEGER2` -> INTEGER1 is greater than INTEGER2
  2. `INTEGER1 -le INTEGER2` -> INTEGER1 is less than or equal to INTEGER2
  2. `INTEGER1 -lt INTEGER2` -> INTEGER1 is less than INTEGER2
  2. `INTEGER1 -ne INTEGER2` -> INTEGER1 is not equal to INTEGER2
- Files
  3. `FILE1 -ef FILE2` -> FILE1 and FILE2 have the same device and inode numbers
  3. `FILE1 -nt FILE2` -> FILE1 is newer (modification date) than FILE2
  3. `FILE1 -ot FILE2` -> FILE1 is older than FILE2
  3. `-b FILE` -> FILE exists and is block special
  3. `-c FILE` -> FILE exists and is character special
  3. `-d FILE` -> FILE exists and is a directory
  3. `-e FILE` -> FILE exists
  3. `-f FILE` -> FILE exists and is a regular file
  3. `-g FILE` -> FILE exists and is set-group-ID
  3. `-G FILE` -> FILE exists and is owned by the effective group ID
  3. `-h FILE` -> FILE exists and is a symbolic link (same as -L)
  3. `-k FILE` -> FILE exists and has its sticky bit set
  3. `-L FILE` -> FILE exists and is a symbolic link (same as -h)
  3. `-N FILE` -> FILE exists and has been modified since it was last read
  3. `-O FILE` -> FILE exists and is owned by the effective user ID
  3. `-p FILE` -> FILE exists and is a named pipe
  3. `-r FILE` -> FILE exists and read permission is granted
  3. `-s FILE` -> FILE exists and has a size greater than zero
  3. `-S FILE` -> FILE exists and is a socket
  3. `-t FD` -> file descriptor FD is opened on a terminal
  3. `-u FILE` -> FILE exists and its set-user-ID bit is set
  3. `-w FILE` -> FILE exists and write permission is granted
  3. `-x FILE` -> FILE exists and execute (or search) permission is granted