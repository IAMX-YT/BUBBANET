#!/data/data/com.termux/files/usr/bin/bash
  
################################
#  Free Internet Access With BUBBA.NET #
################################

#IMPORTS
BUBBAUpdate=`curl --raw https://raw.githubusercontent.com/IAMX-YT/BUBBANET/master/BUBBAUpdate`
BUBBAPath="/data/data/com.termux/files/home/BUBBANET"

Restart(){
bash <(curl -s https://raw.githubusercontent.com/IAMX-YT/BUBBANET/master/BUBBANET.sh)
}

Red='\e[0;31m'  # Red & Black
SkyBlue='\e[0;36m'  # SkyBlue & Black
White='\e[0m' # ORIGNAL {Black & White}

clear
printf "${Red}\nWelcome To BUBBANET"
printf "\n"
printf "${SkyBlue}\nConnecting..."


#Download & Setup BUBBANET 
if [[ ! -d $BUBBAPath ]]; then

#---------------------------------------------------------------------------------------------------------------------- 
#Get The permission of Termux 
# printf "${Red}\nType y${White}" 
# termux-setup-storage

#---------------------------------------------------------------------------------------------------------------------- 
#Checking Required Pakcages 
printf "${Red}\nInstalling... Required Plugins${White}" 
apt update && apt upgrade
pkg install wget curl -y
clear
printf  "${SkyBlue}Plugin are installed${White}" 


#---------------------------------------------------------------------------------------------------------------------- 
#Making Folder
mkdir $BUBBAPath
mkdir $BUBBAPath/storage
mkdir $BUBBAPath/storage/psiphon
mkdir $BUBBAPath/storage/psiphon/database

#---------------------------------------------------------------------------------------------------------------------- 
#Download Program
wget -O $BUBBAPath/BUBBA.sh https://raw.githubusercontent.com/IAMX-YT/BUBBANET/master/BUBBA.sh
wget -O $BUBBAPath/BUBBANET https://raw.githubusercontent.com/IAMX-YT/BUBBANET/master/BUBBANET
wget -O $BUBBAPath/config.json https://raw.githubusercontent.com/IAMX-YT/BUBBANET/master/BUBBA.json
wget -O $BUBBAPath/storage/psiphon/database/psiphon.boltdb  https://raw.githubusercontent.com/IAMX-YT/BUBBANET/master/BUBBANET.db

#---------------------------------------------------------------------------------------------------------------------- 
#SET EXECUTION PERMISSIONS
chmod +x $BUBBAPath/* >/dev/null 2>&1
chmod +x $BUBBAPath/*/* >/dev/null 2>&1
chmod +x $BUBBAPath/*/*/* >/dev/null 2>&1

#---------------------------------------------------------------------------------------------------------------------- 
Restart;



else 
#if BUBBANET alredy Downloaded then


if [[ $BUBBAUpdate == "1" ]]; then
#---------------------------------------------------------------------------------------------------------------------- 




cd $BUBBAPath
./BUBBA.sh

printf "${SkyBlue}Internet Connected Successfully${White}"
# am start -a android.intent.action.VIEW -d https://telegram/socks?server=127.0.0.1&port=3080

#---------------------------------------------------------------------------------------------------------------------- 
else
#---------------------------------------------------------------------------------------------------------------------- 





printf "${Red}\nBUBBA New Update available" 
printf "${Red}\nVersion :${SkyBlue} $BUBBAUpdate" 
rm -rf  $BUBBAPath
Restart;
#---------------------------------------------------------------------------------------------------------------------- 
fi





fi 