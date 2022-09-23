REM This is the installation command: %~dp0\bin\Iris.exe (%~dp0 just points to the directory the script is in allowing relative path)

REM /D=<destination directory for installation> is also an option

for /r %%v in (*.exe) do %%v /S /norestart

cmd /k