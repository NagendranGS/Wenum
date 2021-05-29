#!/bin/sh

clear
figlet "Subdomain Enumeration"
echo "coded by G S Nagendran"
sleep 2

printf "\e[1;77m Tools Used #Sublist3r #AssetFinder #Subfinder \e[0m \n"
echo "$(date '+%D %T' | toilet -f term -F border --gay)"


printf "Enter the domain : "
read domain_var
clear
echo "Enumerating" $domain_var
sleep 1
clear

mkdir ~/results

figlet Subdomain Enumeration
printf "\e[1;77m Trying AssetFinder....!\e[0m \n"
sleep 1
echo $domain_var | assetfinder | tee -a ~/results/ass.txt
clear
printf "\e[1;77m Enumerated successfully using AssetFinder...\e[0m \n"
sleep 1

figlet Subdomain Enumeration
printf "\e[1;77m Trying SubFinder...!\e[0m \n"
sleep 1
echo $domain_var | subfinder | tee -a ~/results/subf.txt
clear
printf "\e[1;77m Enumerated successfully using SubFinder...\e[0m \n"
sleep 2
cat ~/results/ass.txt ~/results/subf.txt >> ~/results/assubf.txt
rm ~/results/ass.txt ~/results/subf.txt
clear

figlet Subdomain Enumeration
printf "\e[1;77m Trying Sublist3r...!\e[0m \n"
sleep 1
python3 Sublist3r/sublist3r.py -d $domain_var -v -o ~/results/sublis.txt
clear
printf "\e[1;77m Enumerated using Sublist3r...\e[0m \n"
sleep 1
cat ~/results/assubf.txt ~/results/sublis.txt >> ~/results/assubfsublis.txt
clear
rm ~/results/assubf.txt ~/results/sublis.txt

figlet Subdomain Enumeration
sleep 1
mv -v ~/results/assubfsublis.txt ~/results/sd.txt
clear

printf "\e[1;77mThe Subdomains are stored as ~/results/sd.txt \e[0m \n"
sleep 1

printf "\e Do you wish to proceed for URL Enumeration...!(y) or (n): $answer\n"
read answer
if [ $answer == y ];
then
printf "Proceeding for URL Enumeration in 3 seconds or quit by Ctrl+C...!"
sleep 3
clear

figlet GAU
sleep 1
cat ~/results/sd.txt | gau | tee -a ~/results/gau.txt && cat ~/results/gau.txt | grep = | tee -a ~/results/p1.txt
clear
printf "\e[1;77m Enumerated using GAU...\e[0m \n"

clear
figlet WAYBACKURLS
sleep 1
cat ~/results/sd.txt | waybackurls | tee -a ~/results/wb.txt && cat ~/results/wb.txt | grep = | tee -a ~/results/p2.txt
clear
printf "\e[1;77m Enumerated using WayBackUrls...\e[0m \n"
clear

python3 ParamSpider/paramspider.py -d $domain_var -l high -o ~/results/p3.txt
clear
printf "\e[1;77m Enumerated using ParamSpider...\e[0m \n"

cat ~/results/p1.txt ~/results/p2.txt ~/results/p3.txt >> ~/results/pa.txt 
cat ~/results/pa.txt | sort -u | tee -a ~/results/url.txt
rm ~/results/p1.txt ~/results/p2.txt ~/results/p3.txt ~/results/pa.txt
clear
printf "\e[1;77mThe URLs Enumerated are stored as ~/results/url.txt \e[0m \n"

elif [ $answer == n ]; 
then 
printf "\eThank You...\n"
exit
else
printf "\e Invalid Option...!\n"
fi

printf "\e[1;77m Do you wish to Filter Parameters for testing (y) or (n): $fpa\n"
read $fpa
sleep 1
if [ $fpa == y ]; 
then 
printf "\e[1;77m Proceeding for Parameter Filtering in 3 seconds...\e[0m \n"
sleep 3
clear

printf "\e[1;77m Filtering Vulnerable SSRF Parameters...\e[0m \n"
sleep 1
mkdir ~/results/Filtered-Parameter
cat ~/results/url.txt | grep 'dest=\|redirect=\|uri=\|path=\|continue=\|url=\|window=\|next=\|data=\|reference=\|site=\|html=\|val=\|validate=\|domain=\|callback=\|return=\|page=\|view=\|dir=\|show=\|file=\|document=\|folder=\|root=\|path=\|pg=\|style=\|php=\|template=\|php_path=\|doc=\|feed=\|host=\|port=\|to=\|out=\|navigation=\|open=\|result=\|' | tee -a ~/results/Filtered-Parameter/ssrf.txt
clear
echo "SSRF parameter enumeration done"
sleep 1

printf "\e[1;77m Filtering Vulnerable Open-Redirect Parameters...\e[0m \n"
sleep 1
cat ~/results/url.txt | grep 'next=\|url=\|target=\|rurl=\|dest=\|destination=\|redir=\|redirect_uri=\|redirect_url=\|redirect=\|redirect\|redirect.cgi?\|out/\|out?\|view=\|login?to=\|image_url=\|go=\|return\|returnTo=\|checkout_url=\|continue=\|return_path=\|' |  tee  -a ~/results/Filtered-Parameter/openredirect.txt
clear
echo "Open Redirect Parameter Enumeration done"
sleep 1

printf "\e[1;77m Filtering Vulnerable SQLi Parameters...\e[0m \n"
sleep 1
cat ~/results/url.txt | grep 'id=\|page=\|dir=\|search=\|category=\|class=\|file=\|url=\|news=\|item=\|menu=\|lang=\|name=\|ref=\|title=\|view=\|topic=\|thread=\|type=\|date=\|form=\|nav=\|main=\|nav=\|region\|' | tee -a ~/results/Filtered-Parameter/sqli.txt
clear
echo "SQLi Parameter Enumeration done"
sleep 1

printf "\e[1;77m Filtering Vulnerable XSS Parameters...\e[0m \n"
sleep 1
cat ~/results/url.txt | grep 'q=\|s=\|search=\|id=\|lang=\|keyword=\|query=\|page=\|keywords=\|year=\|view=\|email=\|type=\|name=\|p=\|month=\|immagine=\|list_type=\|url=\|terms=\|categoryid=\|key=\|l=\|begindate=\|enddate=\|' | grep ~/results/Filtered-Parameter/xss.txt
echo "XSS Parameter Enumeration done"
sleep 1

printf "\e[1;77m Filtering Vulnerable RCE(GET Bases) Parameters...\e[0m \n"
sleep 1
cat ~/results/url.txt | grep 'cmd=\|exec=\|command=\|execute=\|ping=\|query=\|jump=\|code=\|reg=\|do=\|func=\|arg=\|option=\|load=\|process=\|step=\|read=\|function=\|req=\|feature=\|exe=\|module=\|payload=\|run=\|print=\|' | tee -a ~/results/Filtered-Parameter/rce.txt
echo "RCE(GET Based) Parameter Enumeration done"
sleep 1

elif [ $fpa == n ];
then
printf "\eThank You...\n"
else
printf "\eInvalid Option...!\n"
fi