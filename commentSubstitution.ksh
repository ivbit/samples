#!/bin/ksh

# Intellectual property information START
# 
# Copyright (c) 2021 Ivan Bityutskiy 
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
# Sample script shows comment substitution in action.
# If no arguments are provided to the script, the
# script displays the information and exits.
#
# Description END

# Declare variables START
typeset COMMENT='#'
integer theExit=0
(( ! $# )) && {
  COMMENT='print -u2 --'
  theExit=1
}
# Declare variables END

# BEGINNING OF SCRIPT
# if there is at least 1 argument, $COMMENT is equals to '#'
# else $COMMENT is equals to 'print -u2 --'
eval $COMMENT '----------------------------------------'
eval $COMMENT 'Script: commentSubstitution.ksh'
eval $COMMENT 'Creation date: 01 Jun 2021'
eval $COMMENT 'Last modified: 06 Jun 2021'
eval $COMMENT 'Author: Ivan Bityutskiy'
eval $COMMENT 'Autor\\047s email: REDACTED'
eval $COMMENT '----------------------------------------'
eval $COMMENT 'Description: Sample script shows comment'
eval $COMMENT 'substitution in action.'
eval $COMMENT '----------------------------------------'
eval $COMMENT 'Additional files: NONE'
eval $COMMENT '----------------------------------------'

# if script has no arguments, exit
(( theExit )) && exit 1
# if script has arguments, continue executing
print -u2 -- 'Script does it\047s thing...'
print -u2 -- "The argument is: \033[31m$1\033[0m"
uname -a
print -u2 -- 'End of script.'

# END OF SCRIPT

