# Wenum🐍 - Website Enumeration 

While testing a website it is important to perform Scanning/Enumeration. We all may have our own checklist of tools to perform active enumeration on websites. Since time management is a crucial part while Pentesting a website , Wenum provides a hassle free experience. Opening each tool, running enumeration ,saving it in a file and filtering for different types of vulnerability testing made me a bit lazy. All I wish is to enter a domain name and every process involved in enumeration comes handy. Thus I made Wenum.

# Tools used in Wenum🐍

1. Sublist3r - https://github.com/aboul3la/Sublist3r
3. AssetFinder - https://github.com/tomnomnom/assetfinder
4. Subfinder - https://github.com/projectdiscovery/subfinder
5. Nmap - https://nmap.org/
6. httpx - https://github.com/projectdiscovery/httpx
7. GAU - https://github.com/lc/gau
8. WayBackURLs - https://github.com/tomnomnom/waybackurls
9. ParamSpider - https://github.com/devanshbatham/ParamSpider
10. Amass - https://github.com/OWASP/Amass

# What does Wenum🐍 do?

The tool performs a comprehensive security analysis on the specified domain, with features including:

Domain Status Verification: It checks if the domain is active before proceeding with further analysis.
Port Scanning with Nmap: Conducts a detailed port scan to identify open ports and associated services.
Subdomain Enumeration: Utilizes multiple tools to enumerate subdomains, expanding the scope of analysis.
Status Code Filtering: Filters subdomains by HTTP status codes to differentiate between active and inactive ones.
Subdomain Classification:
Saves dead subdomains for potential Subdomain Takeover analysis.
Routes alive subdomains for detailed URL and Directory enumeration.
URL Parameter Separation: Isolates URLs with parameters for a focused vulnerability scan.
Vulnerability-Specific Parameter Identification: Parameters are categorized based on vulnerability types they might expose, including:

    1. Cross Site Scripting (XSS)
    2. Server Side Request Forgery (SSRF)
    2. SQL Injection 
    3. OS Command Injection
    4. Open Redirection
    

Wenum🐍 asks the user at each stage whether to perform the processes mentioned above or to exit.
So that one can exit the process if the enumerated results are enough.


