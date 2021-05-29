# Wenum - Website Enumeration 🌌

While testing a website our option after Reconnaissance would be Scanning/Enumeration. We have our very own checklist of tools to perform active enumeration on websites. Since time management is a crucial part while Pentesting a website , Wenum provides a hassle free experience. Opening each tool, running enumeration ,saving it in a file and filtering for different types of vulnerability testing made me a bit lazy. All I wish is to enter a domain name and every process involved in enumeration comes handy. Thus I made Wenum.

# Tools used in Wenum🌌

1. Sublist3r
3. AssetFinder
4. Subfinder
5. Nmap
6. httpx
7. GAU
8. WayBackURLs
9. ParamSpider

# What does Wenum🌌 do?

Checks whether the given domain is active
Nmap for Port Scanning
Subdomains are enumerated
Subdomains are filtered based on status codes.
Dead Subdomains are saved for Subdomain Takeover
Alive Subdomains are sent for URL and Directory enumeration.
URLs containing parameters are seperated.


Vulnerable parameters for following bugs are seperated individually based on their names

    1. Cross Site Scripting (XSS)
    2. SQL Injection 
    3. OS Command Injection
    4. Remote Code Execution (RCE)
    5. Open Redirection
    

Wenum asks the user at each stage whether to perform the processes mentioned above or to exit.
