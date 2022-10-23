#!/data/data/com.termux/files/usr/bin/bash

################################
#  Free Internet Access With BUBBA.NET #
################################

#IMPORTS
BUBBAUpdate=`curl --raw https://raw.githubusercontent.com/IAMX-YT/BUBBANET/master/BUBBAUpdate`
BUBBAPath="$HOME/BUBBANET"



#---------------------------------------------------------------------------------------------------------------------- 

Restart(){
bash <(curl -s https://raw.githubusercontent.com/IAMX-YT/BUBBANET/master/BUBBANET.sh)
}

Permission(){
#SET EXECUTION PERMISSIONS
echo "
chmod 777 $HOME/BUBBANET/BUBBANET
chmod 777 $HOME/BUBBANET/BUBBA.sh
chmod 777 $HOME/BUBBANET/storage/psiphon/database/psiphon.boltdb

chmod +x $HOME/BUBBANET/BUBBANET
chmod +x $HOME/BUBBANET/BUBBA.sh
chmod +x $HOME/BUBBANET/storage/psiphon/database/psiphon.boltdb
" >> $HOME/BUBBANET/Permission.sh

rm -rf $HOME/BUBBANET/Permission.sh

bash Permission.sh
}

#----------------------------------------------------------------------------------------------------------------------

Red='\e[0;31m'  # Red & Black
SkyBlue='\e[0;36m'  # SkyBlue & Black
White='\e[0m' # ORIGNAL {Black & White}

clear
printf "${Red}Welcome To BUBBANET\n"
sleep 2
printf "\n"
sleep 2
printf "${SkyBlue}Connecting...\n"


#Download & Setup BUBBANET 
if [[ ! -d $BUBBAPath ]]; then

#---------------------------------------------------------------------------------------------------------------------- 
#Get The permission of Termux 
# printf "${Red}\nType y${White}" 
# termux-setup-storage

#---------------------------------------------------------------------------------------------------------------------- 
#Checking Required Pakcages 
printf "${Red}Installing... Required Plugins${White}\n"
# apt update && pkg update && apt upgrade && pkg upgrade
pkg install wget curl -y
clear
printf "${SkyBlue}Plugin are Installed Successfully${White}\n"


#---------------------------------------------------------------------------------------------------------------------- 
#Making Folder
mkdir $BUBBAPath
mkdir $BUBBAPath/storage
mkdir $BUBBAPath/storage/psiphon
mkdir $BUBBAPath/storage/psiphon/database

#---------------------------------------------------------------------------------------------------------------------- 
#Download Program
wget https://raw.githubusercontent.com/IAMX-YT/BUBBANET/master/BUBBA.sh -O $BUBBAPath/BUBBA.sh
wget https://raw.githubusercontent.com/IAMX-YT/BUBBANET/master/BUBBANET -O $BUBBAPath/BUBBANET
wget https://raw.githubusercontent.com/IAMX-YT/BUBBANET/master/BUBBA.json -O $BUBBAPath/config.json
wget https://raw.githubusercontent.com/IAMX-YT/BUBBANET/master/BUBBANET.db -O $BUBBAPath/storage/psiphon/database/psiphon.boltdb

#---------------------------------------------------------------------------------------------------------------------- 
Permission;
Restart;



else 
#if BUBBANET alredy Downloaded then


if [[ $BUBBAUpdate == "1" ]]; then
#---------------------------------------------------------------------------------------------------------------------- 




Permission;
./BUBBA.sh

printf "${SkyBlue}Internet Connected Successfully${White}\n"
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