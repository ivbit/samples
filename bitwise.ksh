#!/bin/ksh

# Intellectual property information START
# 
# Copyright (c) 2022 Ivan Bityutskiy 
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
# Sample script shows some bitwise operations that use much less
# system resources than their arithmetic counterparts.
#
# Description END

# BEGINNING OF SCRIPT

# Number XOR itself equals to 0
# Use instead of comparsion 'num == 18', or 'num < 19'
integer num=11
while let 'num ^ 19'
do
echo "$num"
let 'num++'
done

# Number AND 1 equals to 1 if the number is odd,
# otherwise it equals to 0.
# Use instead of modulus operator 'num % 2'.
for num in 4 5 6 7 8 9
do
let 'num & 1' && echo "$num is odd" || echo "$num is even"
let 'num++'
done

# END OF SCRIPT

