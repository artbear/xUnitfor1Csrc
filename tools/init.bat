echo off
SET mypath=%~dp0
SETLOCAL

set BUILDPATH=.\build

SET RUNNER_ENV=production

IF "%~1"=="" (
set mode="./lib/cf/"
) else (
set mode=%1
)

echo "init"
oscript %mypath%/init.os init-dev --src %mode%
oscript %mypath%/init.os init-dev --src %mode% --dev
exit /B
