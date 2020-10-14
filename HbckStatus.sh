#!/bin/bash
func(){ echo $1 | grep -i "INCONSISTENT" &> /dev/null; return $?; }
VAR=$(sudo -u hbase hbase hbck -details)
#VAR=$(cat /home/arun.algude/test.txt)
I_DETECTED=$(echo -e "$VAR" | grep "inconsistencies detected")
STATUS=$(echo -e "${VAR}" | grep "Status")
L_ERROR=$(echo -e "${VAR}" | grep "ERROR")
I_NUMBER=$(echo -e "${I_DETECTED}" | cut -d" " -f1)
STATUS=$(echo -e "${STATUS}" | rev | cut -d " " -f1 | rev)
if (( I_NUMBER > 0 )) || func ${STATUS}; then
echo -e "${L_ERROR} \n\n Status:${STATUS} \n ${I_DETECTED} \n $(date)" |  mutt -s "Hbase Hbck status on Green Prod Cluster" support.insight@clairvoyantsoft.com,ops@agilone.com,arun.algude@clairvoyantsoft.com
if [[ $? -ne 0 ]]; then echo "Error sending mail"; fi
fi


EU

arun.algude@ip-10-200-6-193:~$ cat .muttrc
set from = "cm_prod_eu@agilone.com"
set realname = "cm_prod_eu@agilone.com"
set smtp_url = "smtp://product@agilone.com@smtp.mandrillapp.com:587/"
set smtp_pass = "A7A6WcOQNLEYnLNUee1Lbw"
set ssl_starttls=yes


support.insight@clairvoyantsoft.com,ops@agilone.com,arun.algude@clairvoyantsoft.com

func(){ echo $1 | grep -i "INCONSISTENT" &> /dev/null; return $?; }
VAR=$(sudo -u hbase hbase hbck -details)
I_DETECTED=$(echo -e "$VAR" | grep "inconsistencies detected")
STATUS=$(echo -e "${VAR}" | grep "Status")
L_ERROR=$(echo -e "${VAR}" | grep "ERROR")
I_NUMBER=$(echo -e "${I_DETECTED}" | cut -d" " -f1)
STATUS=$(echo -e "${STATUS}" | rev | cut -d " " -f1 | rev)
if (( I_NUMBER > 0 )) || func ${STATUS}; then
echo -e "${L_ERROR} \n\n Status:${STATUS} \n ${I_DETECTED} \n $(date)" |  mutt -s "Hbase Hbck status on GCP PROD Cluster" support.insight@clairvoyantsoft.com,ops@agilone.com,arun.algude@clairvoyantsoft.com
if [[ $? -ne 0 ]]; then echo "Error sending mail"; fi
fi

0 10 * * * /bin/bash -c "/home/ansible/Hbase_Monitoring.sh" > /dev/null 2>&1
0 22 * * * /bin/bash -c "/home/ansible/Hbase_Monitoring.sh" > /dev/null 2>&1

Greenprod-- 3PM PDT
Gcpprod. -- 3PM PDT
PROD EU -- 10AM PDT

Prod EU
ip-10-200-7-119 - PROD EU -- 10AM PDT

Green US Prod
ip-10-100-6-110 - Greenprod-- 3PM PDT

GCP Prod
172.27.15.194 -  Gcpprod. -- 3PM PDT
