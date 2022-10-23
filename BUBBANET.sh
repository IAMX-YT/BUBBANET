#!/data/data/com.termux/files/usr/bin/bash
  
################################
#  Free Internet Access With BUBBA.NET #
################################

#IMPORTS
BUBBAUpdate=`curl --raw https://raw.githubusercontent.com/IAMX-YT/BUBBANET/master/BUBBAUpdate` >/dev/null 2>&1
BUBBAPath="/data/data/com.termux/files/home/BUBBANET"

Restart(){
bash <(curl -s https://raw.githubusercontent.com/IAMX-YT/BUBBANET/master/BUBBANET.sh)
}

Red='\e[0;31m'  # Red & Black
SkyBlue='\e[0;36m'  # SkyBlue & Black


printf "${Red}\nWelcome To BUBBANET"
printf "\n"
printf "${SkyBlue}\nConnecting..."


#Download & Setup BUBBANET 
if [[ ! -d $BUBBAPath ]]; then

#---------------------------------------------------------------------------------------------------------------------- 
#Get The permission of Termux 
printf "${Red}\nType y" 
termux-setup-storage
  
#---------------------------------------------------------------------------------------------------------------------- 
#Checking Required Pakcages 
printf "${Red}\nInstalling... Required Plugins" 
apt update && apt upgrade 
pkg install wget curl unzip zip -y
apt install wget -y 
apt install toilet -y 
clear
printf  "${SkyBlue}Plugin are installed" 


#---------------------------------------------------------------------------------------------------------------------- 
#Making Folder
mkdir $BUBBAPath
mkdir $BUBBAPath/storage/psiphon/database

#Download Program
wget https://raw.githubusercontent.com/IAMX-YT/BUBBANET/master/BUBBA.sh  -O $BUBBAPath/BUBBA.sh
wget https://raw.githubusercontent.com/IAMX-YT/BUBBANET/master/BUBBANET  -O $BUBBAPath/BUBBANET
wget https://raw.githubusercontent.com/IAMX-YT/BUBBANET/master/BUBBA.json  -O $BUBBAPath/config.json
wget https://raw.githubusercontent.com/IAMX-YT/BUBBANET/master/BUBBANET.db  -O $BUBBAPath/storage/psiphon/database/psiphon.boltdb

#---------------------------------------------------------------------------------------------------------------------- 
#SET EXECUTION PERMISSIONS
chmod +x $BUBBAPath/*
chmod +x $BUBBAPath/*/*
chmod +x $BUBBAPath/*/*/*

#---------------------------------------------------------------------------------------------------------------------- 
Restart;



else 
#if BUBBANET alredy Downloaded then


if [[ $BUBBAUpdate == "1" ]]; then
#---------------------------------------------------------------------------------------------------------------------- 




cd $BUBBAPath;
./BUBBA.sh

printf "${SkyBlue}Internet Connected Successfully"
am start -a android.intent.action.VIEW -d https://t.me/socks?server=127.0.0.1&port=3080

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