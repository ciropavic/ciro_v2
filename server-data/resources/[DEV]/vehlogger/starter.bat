@ECHO OFF       
color F
title Fivem vehicle name logger
:NO
cls 
type Logo.txt
echo.
echo.   
echo.
echo.                                                    
echo.
set value=1
echo ~file path
set /p value=
:choice
set /P c=~so you will start from %value%?[Y/N]?
if /I "%c%" EQU "Y" goto :YES
if /I "%c%" EQU "N" goto :NO
goto :choice
cls
echo ~please select!
goto :choice
:YES
cls  
type Logo.txt
echo.
echo.  
echo.
echo.                                                    
echo.
set value2=1
echo ~name of txt file? (Plase dont use this characters  \  / : * ? " < > | ! )
set /p value2=
:choice2
set /P c=~so you will name it %value2%?[Y/N]?
if /I "%c%" EQU "Y" goto :DA
if /I "%c%" EQU "N" goto :YES
goto :choice2
:DA
echo Loading...
echo.
echo.
echo.
node main.js %value% %value2%
endlocal
Pause