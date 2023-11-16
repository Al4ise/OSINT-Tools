#!/usr/bin/env bash
opt1="PDL Email"
opt2="PDL Phone"
opt3="PDL Twitter"
opt4="PDL Facebook"
opt5="PDL LinkedIn"
opt6="Twilio Phone"
opt7="Twilio Validation"
opt8="Twilio OpenCNAM"
opt9="Twilio DataAxle"
opt10="Twilio Ekata"
opt11="Twilio Ekata Validate"
opt12="Telnyx Phone"
opt13="CID Name"
opt14="FullContact Email"
opt15="FullContact Phone"
opt16="FullContact Twitter"
opt17="Breach Directory Email"
opt18="Breach Directory Username"
opt19="Breach Directory Password"
opt20="Breach Directory Domain"
opt21="Breach Directory Hash"
opt22="WhoisXMLAPI"
opt23="WhoxyHistorical"

domainmenu=$(zenity  --list  --title "API Tool" --radiolist  --column "" --column "" TRUE "$opt1" FALSE "$opt2" FALSE "$opt3" FALSE "$opt4" FALSE "$opt5" FALSE "$opt6" FALSE "$opt7" FALSE "$opt8" FALSE "$opt9" FALSE "$opt10" FALSE "$opt11" FALSE "$opt12" FALSE "$opt13" FALSE "$opt14" FALSE "$opt15" FALSE "$opt16" FALSE "$opt17" FALSE "$opt18" FALSE "$opt19" FALSE "$opt20" FALSE "$opt21" FALSE "$opt22" FALSE "$opt23" --height=650 --width=300)
case $domainmenu in
$opt1 )
data=$(zenity --entry --title "PDL Email" --text "Email Address")
mkdir -p ~/Documents/API/
cd ~/Documents/API/
curl 'https://api.peopledatalabs.com/v5/person/enrich?pretty=true&api_key=XXXX&email='$data'' > $data-PDL.txt
open ~/Documents/API/
;;
$opt2 )
data=$(zenity --entry --title "PDL Phone" --text "Phone Number")
mkdir -p ~/Documents/API/
cd ~/Documents/API/
curl 'https://api.peopledatalabs.com/v5/person/enrich?pretty=true&api_key=XXXX&phone='$data'' > $data-PDL.txt
open ~/Documents/API/
;;
$opt3 ) n
data=$(zenity --entry --title "PDL Twitter" --text "Twitter Username")
mkdir -p ~/Documents/API/
cd ~/Documents/API/
curl 'https://api.peopledatalabs.com/v5/person/enrich?pretty=true&api_key=XXXX&profile=www.twitter.com/'$data'' > $data-PDL-TW.txt
open ~/Documents/API/
;;
$opt4 )
data=$(zenity --entry --title "PDL Facebook" --text "Facebook Username")
mkdir -p ~/Documents/API/
cd ~/Documents/API/
curl 'https://api.peopledatalabs.com/v5/person/enrich?pretty=true&api_key=XXXX&profile=www.facebook.com/'$data'' > $data-PDL-FB.txt
open ~/Documents/API/
;;
$opt5 )
data=$(zenity --entry --title "PDL LinkedIn" --text "LinkedIn Username")
mkdir -p ~/Documents/API/
cd ~/Documents/API/
curl 'https://api.peopledatalabs.com/v5/person/enrich?pretty=true&api_key=XXXX&profile=www.linkedin.com/'$data'' > $data-PDL-LI.txt
open ~/Documents/API/
;;
$opt6 )
data=$(zenity --entry --title "Twilio Phone" --text "Phone Number")
mkdir -p ~/Documents/API/
cd ~/Documents/API/
curl -X GET 'https://lookups.twilio.com/v1/PhoneNumbers/+1'$data'?Type=caller-name&Type=carrier' \
-u XXXX:XXXX | python3 -mjson.tool  > $data-TW.txt
open ~/Documents/API/
;;
$opt7 )
data=$(zenity --entry --title "Twilio Validation" --text "Phone Number")
mkdir -p ~/Documents/API/
cd ~/Documents/API/
curl -X GET 'https://lookups.twilio.com/v1/PhoneNumbers/+1'$data'?AddOns=real_phone_validation_rpv_turbo' \
-u XXXX:XXXX | python3 -mjson.tool > $data-TW-V.txt
open ~/Documents/API/
;;
$opt8 )
data=$(zenity --entry --title "Twilio OpenCNAM" --text "Phone Number")
mkdir -p ~/Documents/API/
cd ~/Documents/API/
curl -X GET 'https://lookups.twilio.com/v1/PhoneNumbers/+1'$data'?AddOns=telo_opencnam' \
-u XXXX:XXXX | python3 -mjson.tool > $data-TW-O.txt
open ~/Documents/API/
;;
$opt9 )
data=$(zenity --entry --title "Twilio DataAxle" --text "Phone Number")
mkdir -p ~/Documents/API/
cd ~/Documents/API/
curl -X GET 'https://lookups.twilio.com/v1/PhoneNumbers/+1'$data'?AddOns=dataaxle_bizinfo' \
-u XXXX:XXXX | python3 -mjson.tool > $data-TW-D.txt
open ~/Documents/API/
;;
$opt10 )
data=$(zenity --entry --title "Twilio Ekata" --text "Phone Number")
mkdir -p ~/Documents/API/
cd ~/Documents/API/
curl -X GET 'https://lookups.twilio.com/v1/PhoneNumbers/+1'$data'?AddOns=ekata_reverse_phone' \
-u XXXX:XXXX | python3 -mjson.tool > $data-TW-E.txt
open ~/Documents/API/
;;
$opt11 )
data=$(zenity --entry --title "Twilio Ekata Validate" --text "Phone Number")
mkdir -p ~/Documents/API/
cd ~/Documents/API/
curl -X GET 'https://lookups.twilio.com/v1/PhoneNumbers/+1'$data'?AddOns=ekata_phone_valid' \
-u XXXX:XXXX | python3 -mjson.tool > $data-TW-EV.txt
open ~/Documents/API/
;;
$opt12 )
data=$(zenity --entry --title "Telnyx Phone" --text "Phone Number")
mkdir -p ~/Documents/API/
cd ~/Documents/API/
curl -X GET \
  --header "Content-Type: application/json" \
  --header "Accept: application/json" \
  --header "Authorization: Bearer XXXX" \
  "https://api.telnyx.com/v2/number_lookup/+1$data?type=carrier&type=caller-name" | python3 -mjson.tool > $data-Telnyx.txt
open ~/Documents/API/
;;
$opt13 )
data=$(zenity --entry --title "CID Name" --text "Phone Number")
mkdir -p ~/Documents/API/
cd ~/Documents/API/
curl 'https://dip.cidname.com/'$data'/XXXX&output=raw&reply=none' > $data-CID.txt
open ~/Documents/API/
;;
$opt14 )
data=$(zenity --entry --title "FullContact Email" --text "Email Address")
mkdir -p ~/Documents/API/
cd ~/Documents/API/
curl -X POST https://api.fullcontact.com/v3/person.enrich \
-H 'Authorization: Bearer XXXX' \
-H "Content-Type: application/json" \
-d '{
  "emails": [
    "'$data'"
  ]
}' | python3 -mjson.tool > $data-FC.txt
open ~/Documents/API/
;;
$opt15 )
data=$(zenity --entry --title "FullContact Phone" --text "Phone Number")
mkdir -p ~/Documents/API/
cd ~/Documents/API/
curl -X POST https://api.fullcontact.com/v3/person.enrich \
-H 'Authorization: Bearer XXXX' \
-H "Content-Type: application/json" \
-d '{
  "phones": [
    "+1'$data'"
  ]
}' | python3 -mjson.tool > $data-FC.txt
open ~/Documents/API/
;;
$opt16 )
data=$(zenity --entry --title "FullContact Twitter" --text "Twitter Username")
mkdir -p ~/Documents/API/
cd ~/Documents/API/
curl -X POST https://api.fullcontact.com/v3/person.enrich \
-H 'Authorization: Bearer XXXX' \
-H "Content-Type: application/json" \
-d '{
  "profiles": [
    {
      "service": "twitter",
      "username": "'$data'"
    }
  ]
}' | python3 -mjson.tool > $data-FC.txt
open ~/Documents/API/
;;
$opt17 )
data=$(zenity --entry --title "Breach Directory Email" --text "Email Address")
mkdir -p ~/Documents/API/
cd ~/Documents/API/
wget --quiet \
	--method GET \
	--header 'X-RapidAPI-Key: XXXX' \
	--header 'X-RapidAPI-Host: breachdirectory.p.rapidapi.com' \
	--output-document \
	- 'https://breachdirectory.p.rapidapi.com/?func=auto&term='$data'' > $data-BD.txt
open ~/Documents/API/
;;
$opt18 )
data=$(zenity --entry --title "Breach Directory Username" --text "Username")
mkdir -p ~/Documents/API/
cd ~/Documents/API/
wget --quiet \
	--method GET \
	--header 'X-RapidAPI-Key: XXXX' \
	--header 'X-RapidAPI-Host: breachdirectory.p.rapidapi.com' \
	--output-document \
	- 'https://breachdirectory.p.rapidapi.com/?func=auto&term='$data'' > $data-BD.txt
open ~/Documents/API/
;;
$opt19 )
data=$(zenity --entry --title "Breach Directory Password" --text "Password")
mkdir -p ~/Documents/API/
cd ~/Documents/API/
wget --quiet \
	--method GET \
	--header 'X-RapidAPI-Key: XXXX' \
	--header 'X-RapidAPI-Host: breachdirectory.p.rapidapi.com' \
	--output-document \
	- 'https://breachdirectory.p.rapidapi.com/?func=password&term='$data'' > $data-BD.txt
open ~/Documents/API/
;;
$opt20 )
data=$(zenity --entry --title "Breach Directory Domain" --text "Domain")
mkdir -p ~/Documents/API/
cd ~/Documents/API/
wget --quiet \
	--method GET \
	--header 'X-RapidAPI-Key: XXXX' \
	--header 'X-RapidAPI-Host: breachdirectory.p.rapidapi.com' \
	--output-document \
	- 'https://breachdirectory.p.rapidapi.com/?func=domain&term='$data'' > $data-BD.txt
open ~/Documents/API/
;;
$opt21 )
data=$(zenity --entry --title "Breach Directory Hash" --text "Hash")
mkdir -p ~/Documents/API/
cd ~/Documents/API/
wget --quiet \
	--method GET \
	--header 'X-RapidAPI-Key: XXXX' \
	--header 'X-RapidAPI-Host: breachdirectory.p.rapidapi.com' \
	--output-document \
	- 'https://breachdirectory.p.rapidapi.com/?func=dehash&term='$data'' > $data-BD.txt
open ~/Documents/API/
;;
$opt22 )
data=$(zenity --entry --title "WhoisXMLAPI" --text "Domain")
mkdir -p ~/Documents/API/
cd ~/Documents/API/
curl 'https://whois-history.whoisxmlapi.com/api/v1?apiKey=XXXX&domainName='$data'&mode=purchase' | python3 -mjson.tool > $data-WhoisXML.txt
open ~/Documents/API/
;;
$opt23 )
data=$(zenity --entry --title "WhoxyHistorical" --text "Domain")
mkdir -p ~/Documents/API/
cd ~/Documents/API/
curl 'https://api.whoxy.com/?key=XXXX&history='$data'' | python3 -mjson.tool > $data-Whoxy.txt
open ~/Documents/API/
;;
esac
read -rsp $'Press enter to continue...\n'
echo


