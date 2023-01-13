#!/usr/bin/dash

# Intellectual property information START
# 
# Copyright 2022 Ivan Bityutskiy
# 
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
# 
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
# 
# Intellectual property information END

# Description START
#
# The script reads names of input .pdf files from a text file,
# then provides them as an argument string to 'pdftk' command.
# Some file names contain spaces, there are no quotes around those file names in input file.
#
# Description END

# Shell settings START
umask 077
# Shell settings END

# Declare variables START
# The input file contains a list of names of pdf files, each file name is on separate line.
# Some file names contain spaces, there are no quotes around those file names in input file.
# Last line in the file must be an empty line.
inputFile='./fnWithSpaces.txt'
outputFile='./mergedRecipes.pdf'
argString=''
# Declare variables END

# BEGINNING OF SCRIPT
# Putting single quotes around all the file names, populating the argument string with them.
while read line
do
  argString="$argString$(printf -- '%s' "$line" | sed -e "s/^/ '/" -e "s/$/'/")"
done < "$inputFile"

# Removing first space ' ' from the argument string.
# (Does not need to be done, just an example of how to do it.)
argString="$(printf -- '%s' "$argString" | cut -c '2-')"

# Printing out the argument string to see what it looks like.
1>&2 printf -- '\n%s\n' "$argString"

# Using 'eval' shell builtin to properly process single quotes around file names with spaces
# and provide an argument list for the 'pdftk' command.
eval pdftk $argString cat output "$outputFile"

1>&2 printf -- '\n\tFile \033[31m%s\033[0m was successfuly created\n\n' "$outputFile"

# END OF SCRIPT

