
#!/bin/bash
#Created By CYSEC_TIGER
# Tool to automate the whole sudomain and directory bruteforcing part
#Date Created -> 

apt-get install amass  
apt-get install ffuf

while getopts ":d:" userinput; do
	case "$userinput" in
		d) domain=${OPTARG};;
	esac
done

if [ -z "$domain" ]
then
	echo "please input domain with -d domain.txt"
fi
 
amass enum -d $domain --passive -o subdomain.txt; 

for url in ` cat subdomain.txt`; do ffuf -c -w /usr/share/wordlists/dirb/common.txt -u $url/FUZZ; done >> result.txt

echo "Recon partially done"
echo "Go check the result.txt"
cat result.txt
exit 1




