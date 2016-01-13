batchTee.bat

::batchTee.bat  OutputFile  [+]
::
::  Write each line of stdin to both stdout and outputFile.
::  The default behavior is to overwrite any existing outputFile.
::  If the 2nd argument is + then the content is appended to any existing
::  outputFile.
::
::  Limitations:
::
::  1) Lines are limited to ~1000 bytes. The exact maximum line length varies
::     depending on the line number. The SET /P command is limited to reading
::     1021 bytes per line, and each line is prefixed with the line number when
::     it is read.
::
::  2) Trailing control characters are stripped from each line.
::
::  3) Lines will not appear on the console until a newline is issued, or
::     when the input is exhaused. This can be a problem if the left side of
::     the pipe issues a prompt and then waits for user input on the same line.
::     The prompt will not appear until after the input is provided.
::

@echo off
setlocal enableDelayedExpansion
if "%~1" equ ":tee" goto :tee

:lock
set "teeTemp=%temp%\tee%time::=_%"
2>nul (
  9>"%teeTemp%.lock" (
    for %%F in ("%teeTemp%.test") do (
      set "yes="
      pushd "%temp%"
      copy /y nul "%%~nxF" >nul
      for /f "tokens=2 delims=(/" %%A in (
        '^<nul copy /-y nul "%%~nxF"'
      ) do if not defined yes set "yes=%%A"
      popd
    )
    for /f %%A in ("!yes!") do (
      find /n /v ""
      echo :END
      echo %%A
    ) >"%teeTemp%.tmp" | <"%teeTemp%.tmp" "%~f0" :tee %* 7>&1 >nul
    (call )
  ) || goto :lock
)
del "%teeTemp%.lock" "%teeTemp%.tmp" "%teeTemp%.test"
exit /b

:tee
set "redirect=>"
if "%~3" equ "+" set "redirect=>>"
8%redirect% %2 (call :tee2)
set "redirect="
(echo ERROR: %~nx0 unable to open %2)>&7

:tee2
for /l %%. in () do (
  set "ln="
  set /p "ln="
  if defined ln (
    if "!ln:~0,4!" equ ":END" exit
    set "ln=!ln:*]=!"
    (echo(!ln!)>&7
    if defined redirect (echo(!ln!)>&8
  )
)
