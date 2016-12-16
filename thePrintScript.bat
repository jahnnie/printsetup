@ECHO off

SET varIP=printserv.psych.ubc.ca 
SET portName=printserv.psych.ubc.ca_cp1
SET varDriver=Xerox WorkCentre 5890 PS
SET varDriverFolder=C:\Users\%username%\AppData\Local\Temp\IXP000.TMP
SET varDriverFile=C:\Users\%username%\AppData\Local\Temp\IXP000.TMP\x2dlump.inf
SET varName=Xerox WorkCentre 5890 cp1
SET varLocation=CopyRoom

REM CP1
REM "Creating TCP/IP port"
CSCRIPT /nologo %windir%\System32\Printing_Admin_Scripts\en-US\prnport.vbs -a -r %portName% -o lpr -q cp1 -2e -h %varIP%

REM "Installation message"
@ECHO.
@ECHO The %varLocation% printer is currently being installed.
@ECHO.
@ECHO Please do not close this window.
@ECHO.
@ECHO Once the installation is complete this Setup window will exit.
@ECHO.

REM "Driver installation"
CSCRIPT /nologo %windir%\System32\Printing_Admin_Scripts\en-US\prndrvr.vbs -a -m "%varDriver%" -h "%varDriverFolder%" -i "%varDriverFile%"  

REM "Printer deletion"
@ECHO.
@ECHO Deleting.
CSCRIPT /nologo %windir%\System32\Printing_Admin_Scripts\en-US\prnmngr.vbs -d -p "%varName%" 

REM "Printer installation"
@ECHO.
@ECHO Installing printer.
CSCRIPT /nologo %windir%\System32\Printing_Admin_Scripts\en-US\prnmngr.vbs -a -p "%varName%" -m "%varDriver%" -r "%portName%"


REM "Location configuration"
@ECHO.
@ECHO Completing location config.
CSCRIPT /nologo %windir%\System32\Printing_Admin_Scripts\en-US\prncnfg.vbs -t -p "%varName%" -l "%varLocation%"


REM "Making it Default printer"
REM CSCRIPT %windir%\system32\prnmngr.vbs -p "%varName%" -t

@ECHO.
@ECHO Updating printer settings.
RUNDLL32 printui.dll,PrintUIEntry /Sr /n "%varName%" /a "C:\Users\%username%\AppData\Local\Temp\IXP000.TMP\config_cp1.dat" d u g r
REM ----------------------------------------------------------------------------------------------------------------------------------------------------
REM CP2
SET varName=Xerox WorkCentre 5890 cp2
SET portName=printserv.psych.ubc.ca_cp2

REM "Creating TCP/IP port"
CSCRIPT /nologo %windir%\System32\Printing_Admin_Scripts\en-US\prnport.vbs -a -r %portName% -o lpr -q cp2 -2e -h %varIP%
REM "Printer deletion"
@ECHO.
@ECHO Deleting.
CSCRIPT /nologo %windir%\System32\Printing_Admin_Scripts\en-US\prnmngr.vbs -d -p "%varName%" 

REM "Printer installation"
@ECHO.
@ECHO Installing printer.
CSCRIPT /nologo %windir%\System32\Printing_Admin_Scripts\en-US\prnmngr.vbs -a -p "%varName%" -m "%varDriver%" -r "%portName%"


REM "Location configuration"
@ECHO.
@ECHO Completing location config.
CSCRIPT /nologo %windir%\System32\Printing_Admin_Scripts\en-US\prncnfg.vbs -t -p "%varName%" -l "%varLocation%"


REM "Making it Default printer"
REM CSCRIPT %windir%\system32\prnmngr.vbs -p "%varName%" -t

@ECHO.
@ECHO Updating printer settings.
RUNDLL32 printui.dll,PrintUIEntry /Sr /n "%varName%" /a "C:\Users\%username%\AppData\Local\Temp\IXP000.TMP\config_cp2.dat" d u g r

REM Copying Pcounter stuff into Startup folder
copy C:\Users\%username%\AppData\Local\Temp\IXP000.TMP\PcounterClient.exe "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\PcounterClient.exe"
copy C:\Users\%username%\AppData\Local\Temp\IXP000.TMP\PcounterClient.ini "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\PcounterClient.ini"