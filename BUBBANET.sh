#!/data/data/com.termux/files/usr/bin/bash

################################
#  Free Internet Access With BUBBA.NET #
################################

#IMPORTS
BUBBAUpdate=`curl --raw https://raw.githubusercontent.com/IAMX-YT/BUBBANET/master/BUBBAUpdate`
BUBBAPath="/data/data/com.termux/files/home/BUBBANET"



#---------------------------------------------------------------------------------------------------------------------- 

Restart(){
bash <(curl -s https://raw.githubusercontent.com/IAMX-YT/BUBBANET/master/BUBBANET.sh)
}

Permission(){
#SET EXECUTION PERMISSIONS
cat > $BUBBAPath/Permission.sh <<EOF
chmod 777 $BUBBAPath/BUBBANET
chmod +x $BUBBAPath/BUBBANET

chmod 777 $BUBBAPath/BUBBA.sh
chmod +x $BUBBAPath/BUBBA.sh

chmod 777 $BUBBAPath/storage/psiphon/database/psiphon.boltdb
chmod +x $BUBBAPath/storage/psiphon/database/psiphon.boltdb
EOF

bash $BUBBAPath/Permission.sh
rm -rf $BUBBAPath/Permission.sh
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
printf "${Red}Type y${White}\n" 
termux-setup-storage

#---------------------------------------------------------------------------------------------------------------------- 
#Checking Required Pakcages 
printf "${Red}Installing... Required Plugins${White}\n"
apt update && pkg update && apt upgrade && pkg upgrade
pkg install wget curl -y
clear


#---------------------------------------------------------------------------------------------------------------------- 
#Making Folder
mkdir $BUBBAPath
mkdir $BUBBAPath/storage
mkdir $BUBBAPath/storage/psiphon
mkdir $BUBBAPath/storage/psiphon/database

#---------------------------------------------------------------------------------------------------------------------- 
#Download Program
printf "${SkyBlue}Downloading Files${White}\n"
wget https://raw.githubusercontent.com/IAMX-YT/BUBBANET/master/BUBBA -O $BUBBAPath/BUBBA;clear

printf "${SkyBlue}Downloading Files${White}\n"
wget https://raw.githubusercontent.com/IAMX-YT/BUBBANET/master/BUBBANET -O $BUBBAPath/BUBBANET;clear

printf "${SkyBlue}Downloading Files${White}\n"
wget https://raw.githubusercontent.com/IAMX-YT/BUBBANET/master/BUBBA.json -O $BUBBAPath/config.json;clear

printf "${SkyBlue}Downloading Files${White}\n"
wget https://raw.githubusercontent.com/IAMX-YT/BUBBANET/master/BUBBANET.db -O $BUBBAPath/storage/psiphon/database/psiphon.boltdb;clear

#---------------------------------------------------------------------------------------------------------------------- 
printf "${SkyBlue}Plugin are Installed Successfully${White}\n"
printf "${SkyBlue}BUBBA Files are Downloaded Successfully${White}\n"

Permission;
Restart;


else 
#if BUBBANET alredy Downloaded then


if [[ $BUBBAUpdate == "1" ]]; then
#---------------------------------------------------------------------------------------------------------------------- 
P1(){
sleep 1.5
printf "${SkyBlue} B U B B A  N E T" 
printf "${Red} Please Wait till BUBBANET Is Connected" 
}
P2(){
Permission;
cd $BUBBAPath
./BUBBA
}
P1 & P1=$! P2 & P2=$! wait $P1 $P2


clear
printf "${SkyBlue}Tap Enter To Restart Again${White}\n"; read Enter
Restart;

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