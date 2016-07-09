echo off
SET mypath=%~dp0
SETLOCAL

set BUILDPATH=.\build

set RUNNER_IBNAME=/F"%BUILDPATH%/ib"
rem set RUNNER_DBUSER=base
rem set RUNNER_DBPWD=234567890

SET RUNNER_ENV=production1

echo "vanessa"
oscript %mypath%/runner.os xunit %BUILDPATH%/out/Tests/ --path "%BUILDPATH%/out/xddTestRunner.epf" --report "%BUILDPATH%/report.xml"
exit /B
