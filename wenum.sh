#!/bin/sh
#Wenum v2.1
#Coded By G S Nagendran
#Output is stored as results in Home directory
#Tool results are stored in short forms for easy understanding
#Designed for automating Enumeration Phase while Testing a Web Application

clear
toilet --metal  WENUM
printf "                               \e v2.1\n"
echo "Coded By G S Nagendran"
sleep 2
clear
toilet --metal WENUM
printf "\n"
echo "$(date '+%D %T' | toilet -f term -F border --gay)"

# Reading domain variable as domain_var
printf "Enter the domain : "
read domain_var
clear
echo "Checking if the domain is alive..."
sleep 1

# Pinging domain
if [ "$(ping -c 1 "$domain_var")" ]; then
  echo "Domain is Alive, Proceeding For Port Scan...!"
  sleep 1
  clear

  # Directory for Output
  mkdir -p ~/results/sd

  # Port Scan
  figlet NMAP
  nmap -A "$domain_var" -Pn -o ~/results/nmap
  clear
  echo "Scanned Ports Successfully using Nmap...!"
  sleep 1
  echo "Enumerating $domain_var"
  sleep 1
  clear

  # AssetFinder
  (figlet Subdomain Enumeration
  printf "\e[1;77m Trying AssetFinder....!\e[0m \n"
  sleep 1
  echo "$domain_var" | assetfinder | tee -a ~/results/sd/ass.txt) &

  # Subfinder
  (figlet Subdomain Enumeration
  printf "\e[1;77m Trying SubFinder...!\e[0m \n"
  sleep 1
  echo "$domain_var" | subfinder | tee -a ~/results/sd/subf.txt) &

  # Sublist3r
  (figlet Subdomain Enumeration
  printf "\e[1;77m Trying Sublist3r...!\e[0m \n"
  sleep 1
  python3 Sublist3r/sublist3r.py -d "$domain_var" -v | tee -a ~/results/sd/sublis.txt) &

  # Amass
  (figlet Subdomain Enumeration
  printf "\e[1;77m Trying Amass...!\e[0m \n"
  amass enum --passive -d "$domain_var" -o ~/results/sd/amass1.txt
  amass enum -src -ip -brute -min-for-recursive 2 -d "$domain_var" -o ~/results/sd/amass2.txt
  clear
  sleep 1
  cat ~/results/sd/assubfsublis.txt ~/results/sd/amass1.txt ~/results/sd/amass2.txt >> ~/results/sd/sd.txt
  rm ~/results/sd/assubfsublis.txt ~/results/sd/amass1.txt ~/results/sd/amass2.txt
  clear) &

  wait # Wait for all background processes to finish

  # Filtering Subdomains based on Status Codes
  printf "\e[1;77m Filtering Subdomains based on Status Codes...! \e[0m \n"
  
  fourzerothree=$(cat ~/results/sd/sd.txt | httpx -status-code -silent | grep 403 | wc -l)
  if [ "$fourzerothree" -ge 1 ]; then
    cat ~/results/sd/sd.txt | httpx -status-code -silent | grep 403 | tee -a ~/results/sd/403
  else
    echo "403 not available...!"
    sleep 1
  fi

  twohundred=$(cat ~/results/sd/sd.txt | httpx -status-code -silent | grep 200 | wc -l)
  if [ "$twohundred" -ge  1 ]; then
    cat ~/results/sd/sd.txt | httpx -status-code -silent | grep 200 | tee -a ~/results/sd/200
  else
    echo "200 not available...!"
    sleep 1
  fi

  threezeroone=$(cat ~/results/sd/sd.txt | httpx -status-code -silent | grep 301 | wc -l)
  if [ "$threezeroone" -ge 1 ]; then
    cat ~/results/sd/sd.txt | httpx -status-code -silent | grep 301 | tee -a ~/results/sd/301
  else
    echo "301 not available...!"
    sleep 1
  fi

  fourzeroone=$(cat ~/results/sd/sd.txt | httpx -status-code -silent | grep 401)
  if [ "$fourzeroone" -ge 1 ]; then
    cat ~/results/sd/sd.txt | httpx -status-code -silent | grep 401 | tee -a ~/results/sd/301
  else
    echo "401 not available...!"
    sleep 1
  fi

  clear
  printf "\e[1;77mThe Subdomains and filtered status codes are stored in ~/results/sd \e[0m \n"
  sleep 1

  # Proceed for URL Enumeration
  printf "\e Do you wish to proceed for URL Enumeration...!(y) or (n): "
  read -r answer

  if [ "$answer" = "y" ]; then
    printf "Proceeding for URL Enumeration in 3 seconds or quit by Ctrl+C...!"
    sleep 3
    clear

    # GAU
    (figlet GAU
    sleep 1
    cat ~/results/sd/sd.txt | gau | tee -a ~/results/gau.txt && cat ~/results/gau.txt | grep = | tee -a ~/results/p1.txt) &

    # WAYBACKURLS
    (figlet WAYBACKURLS
    sleep 1
    cat ~/results/sd/sd.txt | waybackurls | tee -a ~/results/wb.txt && cat ~/results/wb.txt | grep = | tee -a ~/results/p2.txt) &

    # ParamSpider
    (python3 ParamSpider/paramspider.py -d "$domain_var" -l high -o ~/results/p3.txt) &

    wait # Wait for all background processes to finish

    # Enumerated using GAU
    clear
    printf "\e[1;77m Enumerated using GAU...\e[0m \n"

    # Enumerated using WayBackUrls
    clear
    printf "\e[1;77m Enumerated using WayBackUrls...\e[0m \n"

    # Enumerated using ParamSpider
    clear
    printf "\e[1;77m Enumerated using ParamSpider...\e[0m \n"

    cat ~/results/p1.txt ~/results/p2.txt ~/results/p3.txt >> ~/results/pa.txt 
    cat ~/results/pa.txt | sort -u | tee -a ~/results/param.txt
    rm ~/results/p1.txt ~/results/p2.txt ~/results/p3.txt ~/results/pa.txt
    cat ~/results/wb.txt ~/results/gau.txt | sort -u >> ~/results/urls.txt && rm ~/results/wb.txt ~/results/gau.txt
    clear
    printf "\e[1;77mThe URLs Enumerated are stored as ~/results/url.txt \e[0m \n"

  elif [ "$answer" = "n" ]; then
    printf "\e Thank You...\n"
    exit
  else
    printf "\e Invalid Option...!\n"
  fi

  printf "\e[1;77m Do you wish to Filter Parameters for testing (y) or (n): "
  read -r fpa
  sleep 1

  if [ "$fpa" = "y" ]; then
    printf "\e[1;77m Proceeding for Parameter Filtering in 3 seconds...\e[0m \n"
    sleep 3
    clear

    # Filtering Vulnerable SSRF Parameters
    printf "\e[1;77m Filtering Vulnerable SSRF Parameters...\e[0m \n"
    sleep 1
    cat ~/results/param.txt | grep 'dest=\|redirect=\|uri=\|path=\|continue=\|url=\|window=\|next=\|data=\|reference=\|site=\|html=\|val=\|validate=\|domain=\|callback=\|return=\|page=\|view=\|dir=\|show=\|file=\|document=\|folder=\|root=\|path=\|pg=\|style=\|php=\|template=\|php_path=\|doc=\|feed=\|host=\|port=\|to=\|out=\|navigation=\|open=\|result=' | tee -a ~/results/Filtered-Parameter/ssrf.txt
    clear
    echo "SSRF parameter enumeration done"
    sleep 1

    # Filtering Vulnerable Open-Redirect Parameters
    printf "\e[1;77m Filtering Vulnerable Open-Redirect Parameters...\e[0m \n"
    sleep 1
    cat ~/results/param.txt | grep 'next=\|url=\|target=\|rurl=\|dest=\|destination=\|redir=\|redirect_uri=\|redirect_url=\|redirect=\|redirect\|redirect.cgi?\|out/\|out?\|view=\|login?to=\|image_url=\|go=\|return\|returnTo=\|checkout_url=\|continue=\|return_path=' |  tee  -a ~/results/Filtered-Parameter/openredirect.txt
    clear
    echo "Open Redirect Parameter Enumeration done"
    sleep 1

    # Filtering Vulnerable SQLi Parameters
    printf "\e[1;77m Filtering Vulnerable SQLi Parameters...\e[0m \n"
    sleep 1
    cat ~/results/param.txt | grep 'id=\|page=\|dir=\|search=\|category=\|class=\|file=\|url=\|news=\|item=\|menu=\|lang=\|name=\|ref=\|title=\|view=\|topic=\|thread=\|type=\|date=\|form=\|nav=\|main=\|nav=\|region=' | tee -a ~/results/Filtered-Parameter/sqli.txt
    clear
    echo "SQLi Parameter Enumeration done"
    sleep 1

    # Filtering Vulnerable XSS Parameters
    printf "\e[1;77m Filtering Vulnerable XSS Parameters...\e[0m \n"
    sleep 1
    cat ~/results/param.txt | grep 'q=\|s=\|search=\|id=\|lang=\|keyword=\|query=\|page=\|keywords=\|year=\|view=\|email=\|type=\|name=\|p=\|month=\|immagine=\|list_type=\|url=\|terms=\|categoryid=\|key=\|l=\|begindate=\|enddate=' | grep ~/results/Filtered-Parameter/xss.txt
    echo "XSS Parameter Enumeration done"
    sleep 1

    # Filtering Vulnerable RCE(GET Bases) Parameters
    printf "\e[1;77m Filtering Vulnerable RCE(GET Bases) Parameters...\e[0m \n"
    sleep 1
    cat ~/results/param.txt | grep 'cmd=\|exec=\|command=\|execute=\|ping=\|query=\|jump=\|code=\|reg=\|do=\|func=\|arg=\|option=\|load=\|process=\|step=\|read=\|function=\|req=\|feature=\|exe=\|module=\|payload=\|run=\|print=' | tee -a ~/results/Filtered-Parameter/rce.txt
    echo "RCE(GET Based) Parameter Enumeration done"
    sleep 1

  elif [ "$fpa" = "n" ]; then
    printf "\eThank You...\n"
  else
    printf "\eInvalid Option...!\n"
  fi

else
  clear
  echo "Dead Domain, Enter the correct one!"
  exit
fi
