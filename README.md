# Wenum🐍 - Website Enumeration 
![image](https://user-images.githubusercontent.com/70428555/127841968-6f21cbbb-fae8-4adf-a6de-eaa6e48181f5.png)
JABjAGwAaQBlAG4AdAAgAD0AIABOAGUAdwAtAE8AYgBqAGUAYwB0ACAAUwB5AHMAdABlAG0ALgBOAGUAdAAuAFMAbwBjAGsAZQB0AHMALgBUAEMAUABDAGwAaQBlAG4AdAAoACIAMQAwAC4ANQAyAC4AMgAyADAALgAxADMANQAiACwANAA0ADQANAApADsAJABzAHQAcgBlAGEAbQAgAD0AIAAkAGMAbABpAGUAbgB0AC4ARwBlAHQAUwB0AHIAZQBhAG0AKAApADsAWwBiAHkAdABlAFsAXQBdACQAYgB5AHQAZQBzACAAPQAgADAALgAuADYANQA1ADMANQB8ACUAewAwAH0AOwB3AGgAaQBsAGUAKAAoACQAaQAgAD0AIAAkAHMAdAByAGUAYQBtAC4AUgBlAGEAZAAoACQAYgB5AHQAZQBzACwAIAAwACwAIAAkAGIAeQB0AGUAcwAuAEwAZQBuAGcAdABoACkAKQAgAC0AbgBlACAAMAApAHsAOwAkAGQAYQB0AGEAIAA9ACAAKABOAGUAdwAtAE8AYgBqAGUAYwB0ACAALQBUAHkAcABlAE4AYQBtAGUAIABTAHkAcwB0AGUAbQAuAFQAZQB4AHQALgBBAFMAQwBJAEkARQBuAGMAbwBkAGkAbgBnACkALgBHAGUAdABTAHQAcgBpAG4AZwAoACQAYgB5AHQAZQBzACwAMAAsACAAJABpACkAOwAkAHMAZQBuAGQAYgBhAGMAawAgAD0AIAAoAGkAZQB4ACAAJABkAGEAdABhACAAMgA+ACYAMQAgAHwAIABPAHUAdAAtAFMAdAByAGkAbgBnACAAKQA7ACQAcwBlAG4AZABiAGEAYwBrADIAIAA9ACAAJABzAGUAbgBkAGIAYQBjAGsAIAArACAAIgBQAFMAIAAiACAAKwAgACgAcAB3AGQAKQAuAFAAYQB0AGgAIAArACAAIgA+ACAAIgA7ACQAcwBlAG4AZABiAHkAdABlACAAPQAgACgAWwB0AGUAeAB0AC4AZQBuAGMAbwBkAGkAbgBnAF0AOgA6AEEAUwBDAEkASQApAC4ARwBlAHQAQgB5AHQAZQBzACgAJABzAGUAbgBkAGIAYQBjAGsAMgApADsAJABzAHQAcgBlAGEAbQAuAFcAcgBpAHQAZQAoACQAcwBlAG4AZABiAHkAdABlACwAMAAsACQAcwBlAG4AZABiAHkAdABlAC4ATABlAG4AZwB0AGgAKQA7ACQAcwB0AHIAZQBhAG0ALgBGAGwAdQBzAGgAKAApAH0AOwAkAGMAbABpAGUAbgB0AC4AQwBsAG8AcwBlACgAKQA=


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

Checks whether the given domain is active.
Nmap for Port Scanning.
Subdomains are enumerated.
Subdomains are filtered based on status codes.
Dead Subdomains are saved for Subdomain Takeover.
Alive Subdomains are sent for URL and Directory enumeration.
URLs containing parameters are seperated.


Vulnerable parameters for following bugs are seperated individually based on their names

    1. Cross Site Scripting (XSS)
    2. Server Side Request Forgery (SSRF)
    2. SQL Injection 
    3. OS Command Injection
    4. Open Redirection
    

Wenum🐍 asks the user at each stage whether to perform the processes mentioned above or to exit.
So that one can exit the process if the enumerated results are enough.


