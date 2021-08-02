#!/bin/bash
sudo apt-get install toilet
sudo apt-get install figlet
clear
toilet --metal  WENUM 
printf "                               \e v1.0\n"
echo "Coded By G S Nagendran"
sleep 2
clear
toilet --metal WENUM
printf "\n"

   sudo apt-get update
   sudo apt-get upgrade
   sudo apt-get clean
   sudo apt-get autoclean
   sudo apt-get install toilet
   clear

printf "\e \n Do you have Go and Sublist3r installed (y) or (n)?...: $answer"
read answer
if [ $answer == n ];
then
     printf "Installing Sublist3r in current directory..."
     sleep 1
     git clone https://github.com/aboul3la/Sublist3r
     clear
     echo " Visit https://tzusec.com/how-to-install-golang-in-kali-linux/ for installing go lang  "
     exit
elif [ $answer == y ];
then
   
   printf "Change 41th line as per your Sublist3r tool directory location..."
   printf "\eStarting Installation...\n"
   printf "\e[1;77m Grab a Coffee this'll take some time... :)\e[0 \n"
   sleep 2
   go get -u github.com/tomnomnom/assetfinder
   go get -v github.com/projectdiscovery/subfinder
   git clone https://github.com/aboul3la/Sublist3r
   mv * ~/go/bin 
   cd Sublist3r
   pip3 install -r requirements.txt
   pip2 install -r requirements.txt
   pip install -t requirements.txt && cd ..
   sudo apt-get clean
   sudo apt-get autoclean
else
   printf "\eInvalid Option...!\n"
   exit
fi
chmod a+rwx wenum.sh
sudo cp wenum.sh /usr/bin/wenum
clear
toilet --metal  WENUM 
printf "                               \e v1.0\n"
echo "Coded By G S Nagendran"
sleep 2
clear
toilet --metal WENUM
printf "\n"
printf " Run by typing wenum in your terminal... :) \n" 
