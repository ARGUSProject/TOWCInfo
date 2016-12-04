
@echo off
echo "This program is meant only for simple and educational/personal uses"
echo "choose what you want!"
goto menu
:menu
echo "[1] Check for Certain Port"
echo "[2] Scan all Open Ports"
echo "[3] Scan Tool"
echo "[4] Close the Program"
echo 
set /p $mc="What would you like to do: "
if $mc==1 goto 1
#if $mc==2 goto 2
#if $mc==3 goto 3
#if $mc==4 goto 4#
#
#
#:1
#echo Not Set Up Yet
#goto menu
#:2	
#echo Not Set Up Yet
#goto menu
#:3
#echo work or some shit
#if exist $userprofile$\Desktop\$NSL$_info.txt del $userprofile$\Desktop\$NSL$_info.txt
#set /p $NSL="Enter IP: "
#echo Scanning $NSL > $userprofile\Desktop\$NSL_info.txt
#nslookup $NSL
#echo All of this info will be placed on your desktop
#timeout 9#
#
#goto menu
#:4
#echo Closing...
#exit
