# Shell_scripting
#practice
#Shell script commands
Shell Script allows us to combine and run multiple commands together.

================================================

Some basic commands:

xdg-open <file_name> //to open a file.

Pip ( using | ): o/p of one command as input to other command.

find : //To esearch files

grep: //To search contents of files

grep -i //case insensitive

sudo bash //To open bash as a root

myvar=3 //Assign value 3 to variable myvar echo "$myvar" //Access value of myvar using $myvar

echo ${myvar} //same as echo $myvar //same as echo "$myvar"

unset myvar //To de assign value to myvar

mycommand=ls $mycommand //Will list files now.

Environment Variables: echo $HOME echo $USER echo $PATH

d=$(ls) //Assign output of ls command to d variable.

read myvalue //another way to assign some value to variable myvalue

read -p "Enter your Age:" age exho "you are $age"

read -s password

which ls //Shows where ls binary is present e.g. /bin/ls

================================================

#! /bin/bash

Shell Script Editor Recommendation: TextMate Sublime Text Atom MacVim Brackets

================================================

Arithmatic Expressions

If Else Conditions

Exit

Logic Conditions (-o for logical OR, -a for logical and)

If on strings

if[ -z "$str"] //Check if string is empty

If On Files:

#File Exist if [ -e $myfile ];
#File DOES NOT Exist

if [ ! -e $myfile ];
Directory (is a directory)

if [ -d $myfile ];
#File exists And is Readable

if [ -r $myfile ];
#File exists And is Writable

if [ -w $myfile ];
#File Exists and is Executable

if [ -x $myfile ];
#File Exists and it is NOT Empty

if [ -s $myfile ];

For Loops While loops Cases Sleep Exit status: echo $? Functions:
? (Return Value) Variables Scope (local and global)
