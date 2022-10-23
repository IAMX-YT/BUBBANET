#!/data/data/com.termux/files/usr/bin/bash env 
  
################################
#  Free Internet Access With BUBBA.NET #
################################
  
  
echo "Welcome To BUBBANET" 
sleep 1 
echo "" 
echo "Connecting..." 
sleep 4 


#IMPORTS
BUBBAUpdate=`curl --raw https://raw.githubusercontent.com/IAMX-YT/BUBBANET/master/BUBBAUpdate` >/dev/null 2>&1
BUBBAPath="/data/data/com.termux/files/home/BUBBANET"



#Download & Setup BUBBANET 
if [[ ! -d $BUBBAPath ]]; then

#---------------------------------------------------------------------------------------------------------------------- 
#Get The permission of Termux 
echo "Type y" 
termux-setup-storage
  
#---------------------------------------------------------------------------------------------------------------------- 
#Checking Required Pakcages 
echo -e "Installing... Required Plugins" 
apt update && apt upgrade 
pkg install wget curl unzip zip -y
apt install wget -y 
apt install toilet -y 
clear
echo -e  "Plugin are installed" 


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



else #if BUBBANET alredy Downloaded then


if [[ $BUBBAUpdate == "1" ]]; then
#---------------------------------------------------------------------------------------------------------------------- 




cd $BUBBAPath;
./BUBBA.sh

echo -e "Internet Connected Successfully"
am start -a android.intent.action.VIEW -d https://t.me/socks?server=127.0.0.1&port=3080

#---------------------------------------------------------------------------------------------------------------------- 
else
#---------------------------------------------------------------------------------------------------------------------- 





echo -e "BUBBA New Update available" 
echo -e "Version : $BUBBAUpdate" 
rm -rf  $BUBBAPath
bash <(curl -s https://raw.githubusercontent.com/IAMX-YT/BUBBANET/master/BUBBANET.sh)
#---------------------------------------------------------------------------------------------------------------------- 
fi





fi 