#!/bin/bash
printf "\e Do you have Go and Sublist3r installed (y) or (n)?...: $answer"
read answer
if [ $answer == n ];
then
     sudo apt-get install golang
     sudo echo "export GOPATH=/root/go-workspace
     export GOROOT=/usr/local/go
     PATH=$PATH:$GOROOT/bin/:$GOPATH/bin
     source $GOPATH/src/github.com/tomnomnom/gf/gf-completion.bash" >> ~/.bashrc
     source ~/.bashrc
elif [ $answer == y ];
then
   printf "\eStarting Installation...\n"
   printf "\e[1;77m Grab a Coffee this'll take some time... :)\e[0 \n"
   sleep 2
   sudo apt-get update
   sudo apt-get upgrade
   sudo apt-get clean
   sudo apt-get autoclean
   sudo apt-get install figlet
   sudo apt-get install amass
   sudo apt-get install toilet
   go get -u github.com/tomnomnom/assetfinder
   go get -v github.com/projectdiscovery/subfinder
   git clone https://github.com/aboul3la/Sublist3r
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
