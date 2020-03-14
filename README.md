# LinuxScripts
## Shell scripting
##### Assign variables
```bash
foo=bar
echo "$foo" # prints bar
echo '$foo' # prints $foo as literal string
```
##### Special characters

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
##### Control flow techniques
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
##### Error codes
- Commands will often return output using STDOUT, errors through STDERR and a Return Code to report errors in a more script friendly manner
- exit codes to conditionally execute commands
```bash
false || echo "Oops, fail" # false returns 1 to STD:ERR
true || echo "Will not be printed" # true returns 0 to STD:ERR
true && echo "Things went well"
false && echo "Will not be printed"
false ; echo "This will always run"
```
##### Substitution
- Command substitution `$( CMD )`
  * `for file in $(ls)`
- Process substitution `<( CMD )`
  * `diff <(ls foo) <(ls bar)`
##### Globbing
- Wildcards `?`, `*`
- Common substring `{}`
##### Test `[[]]`
- Expressions
  1. `( EXPRESSION )` -> EXPRESSION is true
  1. `! EXPRESSION` -> EXPRESSION is false
  1. `EXPRESSION1 && EXPRESSION2` -> both EXPRESSION1 **AND** EXPRESSION2 are true
  1. `EXPRESSION1 || EXPRESSION2` -> either EXPRESSION1 **OR** EXPRESSION2 is true
- Strings
  1. `-n STRING` -> the length of STRING is nonzero
  1. `-z STRING` -> the length of STRING is zero
  1. `STRING1 = STRING2` -> the strings are equal
  1. `STRING1 = PATTERN` -> the string matches pattern
  1. `STRING1 =~ REGEX` -> the string matches regex
  1. `STRING1 != STRING2` -> the strings are not equal
- Integers
  1. `INTEGER1 -eq INTEGER2` -> INTEGER1 is equal to INTEGER2
  1. `INTEGER1 -ge INTEGER2` -> INTEGER1 is greater than or equal to INTEGER2
  1. `INTEGER1 -gt INTEGER2` -> INTEGER1 is greater than INTEGER2
  1. `INTEGER1 -le INTEGER2` -> INTEGER1 is less than or equal to INTEGER2
  1. `INTEGER1 -lt INTEGER2` -> INTEGER1 is less than INTEGER2
  1. `INTEGER1 -ne INTEGER2` -> INTEGER1 is not equal to INTEGER2
- Files
  1. `FILE1 -ef FILE2` -> FILE1 and FILE2 have the same device and inode numbers
  1. `FILE1 -nt FILE2` -> FILE1 is newer (modification date) than FILE2
  1. `FILE1 -ot FILE2` -> FILE1 is older than FILE2
  1. `-b FILE` -> FILE exists and is block special
  1. `-c FILE` -> FILE exists and is character special
  1. `-d FILE` -> FILE exists and is a directory
  1. `-e FILE` -> FILE exists
  1. `-f FILE` -> FILE exists and is a regular file
  1. `-g FILE` -> FILE exists and is set-group-ID
  1. `-G FILE` -> FILE exists and is owned by the effective group ID
  1. `-h FILE` -> FILE exists and is a symbolic link (same as -L)
  1. `-k FILE` -> FILE exists and has its sticky bit set
  1. `-L FILE` -> FILE exists and is a symbolic link (same as -h)
  1. `-N FILE` -> FILE exists and has been modified since it was last read
  1. `-O FILE` -> FILE exists and is owned by the effective user ID
  1. `-p FILE` -> FILE exists and is a named pipe
  1. `-r FILE` -> FILE exists and read permission is granted
  1. `-s FILE` -> FILE exists and has a size greater than zero
  1. `-S FILE` -> FILE exists and is a socket
  1. `-t FD` -> file descriptor FD is opened on a terminal
  1. `-u FILE` -> FILE exists and its set-user-ID bit is set
  1. `-w FILE` -> FILE exists and write permission is granted
  1. `-x FILE` -> FILE exists and execute (or search) permission is granted