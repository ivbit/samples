@if (1 == 0) @end; /* Commenting all Batch code to hide it from JScript engine.
@echo off

goto :beginningOfScript

Intellectual property information START

Copyright (c) 2024 Ivan Bityutskiy 

Permission to use, copy, modify, and distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

Intellectual property information END

Description START

The script will compute the next date (3 months default).
The computed date is not precise, good enough for general use.

Description END

:beginningOfScript
SETLOCAL EnableExtensions EnableDelayedExpansion

rem Declare variables START
rem Retrieve number of months as an argument, default is 3
set numMonths=3
if NOT "%~1"=="" set /A "userInput=%~1"
if "%~1"=="" set /P "userInput=Enter a number of months (1..12): "
set /A "userInput=%userInput:~0,2%"
if %userInput% GEQ 1 if %userInput% LEQ 12 set "numMonths=%userInput%"
rem Declare variables END

rem Reset the ERRORLEVEL to 0
> NUL verify

rem Compute and display the date
echo:
cscript.exe //E:jscript //Nologo "%~f0" %numMonths%
echo:
set /P "pressAnyKey=Press any key to quit..."

ENDLOCAL

goto :EOF


BEGINNING OF JScript PART OF THE SCRIPT

Define functions START
The function will receive the difference in
months as amtMonths argument, and use it to
compute the next date. */
function computeDate(amtMonths) {
  var theDate = new Date();

  var theDay = theDate.getDate().toString();
  // Force 2 digit output format, as 01, 09, 22, 30, ...
  theDay = '0' + theDay;
  theDay = theDay.substring(theDay.length - 2);

  /* First month in JScript has a 0 index, adding 1 to
     convert it to human readable format */
  var intMonth = (theDate.getMonth() + 1 + parseInt(amtMonths));
  if (intMonth > 12) {
    var theMonth = (intMonth - 12).toString();
    var fullYear = (theDate.getFullYear() + 1).toString();
  } else {
    var theMonth = intMonth.toString();
    var fullYear = theDate.getFullYear().toString();
  }
  // Force 2 digit output format, as 01, 09, 10, ...
  theMonth = '0' + theMonth;
  theMonth = theMonth.substring(theMonth.length - 2);

  // result in format pyyMMdd
  var result = amtMonths + ' months from now: ' + theDay + '.' + theMonth + '.' + fullYear;

  return result;
}
/* Define functions END

Call the function with argument passed to cscript.exe */
WScript.Echo(computeDate(WScript.Arguments(0)));

// END OF SCRIPT

