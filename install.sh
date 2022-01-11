#!/bin/bash
#Coded By Vivek.A.Nadig
#Colors
blue='\033[1;34m'
yellow="\033[1;33m"
green="\033[1;32m"
red="\033[1;31m"
Cyan="\033[0;36m"
nc="\e[0m"

echo -ne "Checking for the Internet Connection......\n" #statement
wget -q --spider http://ifconfig.me #checking internet connection 	
if [ $? -eq 0 ]; then #if internet is connected 
	echo -ne "Connection established[$green✓$nc] $nc "
	sleep 2
	clear # to clear everything on terminal
else 
	echo -ne "There is no Internet connection,Try again"
	exit 1
fi

REQUIRED_PKG="wmctrl"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
# echo Checking for $REQUIRED_PKG: $PKG_OK
if [ "" = "$PKG_OK" ]; then
  echo "No $REQUIRED_PKG found,skipping screen resize"
  sleep 1
  clear
  exit 0	
else 
	echo "Setting Screen Size"
	wmctrl -r :ACTIVE: -e '0,152,116,1396,747'
	clear
fi

REQUIRED_PKG="ghostscript" #chechking applications
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
# echo Checking for $REQUIRED_PKG: $PKG_OK
if [ "" = "$PKG_OK" ]; then
  echo "No ghostscript found. Setting up $REQUIRED_PKG,Please Wait......"
  sudo apt-get --yes install $REQUIRED_PKG > /dev/null
  sleep 1
  clear

fi

REQUIRED_PKG="wget" #chechking applications
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
# echo Checking for $REQUIRED_PKG: $PKG_OK
if [ "" = "$PKG_OK" ]; then
  echo "No Wget found. Setting up $REQUIRED_PKG,Please Wait ....."
  sudo apt-get --yes install $REQUIRED_PKG
  sleep 1
  clear

fi

echo -ne "${green}													" #banner
echo    "													   "
echo    "	#    #   ##   #    # #    #   ##   #####    ##         ######       #    #   ##    ####             "
echo    "	#   #   #  #  ##   # ##   #  #  #  #    #  #  #        #            ##  ##  #  #  #    #            "
echo    "	####   #    # # #  # # #  # #    # #    # #    # ##### #####  ##### # ## # #    # #           	   "
echo    "	#  #   ###### #  # # #  # # ###### #    # ######       #            #    # ###### #  ###      	   "
echo    "	#   #  #    # #   ## #   ## #    # #    # #    #       #            #    # #    # #    #            "
echo -ne   "	#    # #    # #    # #    # #    # #####  #    #       ######       #    # #    #  ####   ${blue} [v1] ${nc}"
echo " "
echo " "
echo -e "					[+]${red} Coded By Vivek.A.Nadig${nc} [+]"
echo ""
echo -e "$yellow Select From Menu : $nc"
echo ""
echo -e "		$Cyan 1 : Sudha$nc"
echo -e "		$Cyan 2 : Mayura$nc"
echo -e "		$Cyan 99: Exit$nc"

read -p "Choice >  " ch

if [ $ch = 1 ]; then
echo -e "			$yellow Sudha$nc" #By Vivek.A.Nadig
temp_dir=$(mktemp -d -p ./) #creates temp dir
trap 'rm -rf -- "$temp_dir" ' EXIT #exit handler to remove temp dir in case of ctrl+c or crash 
DTER=`date -dthursday +-%d%b` #to rename the file with date and month
DTE=`date -dthursday +%m%d%y`  #to get thursday of this week
echo -ne 'Downloading - >>                     (10%)\r' #status
echo -ne 'Downloading - >>>                    (23%)\r' #status
sleep 3
echo -ne 'Downloading - >>>>>>                 (38%)\r' #status
sleep 3
echo -ne 'Downloading - >>>>>>>>>>>>>>>>       (55%)\r' #status
sleep 2
echo -ne 'Downloading - >>>>>>>>>>>>>>>>>      (58%)\r' #status
wget -r -np -nd -A "*.pdf" http://sudhaezine.com/Sudha_Fs/$DTE/page -q -P $temp_dir #to download all the files using the website -q is for silent output and *.pdf to download all pdf file from dir
echo -ne 'Downloading - >>>>>>>>>>>>>>>>>>>    (60%)\r'
cd $temp_dir && pdfunite $(ls -v *.pdf) sudha$DTER.pdf #to unite the pdf
echo -ne 'Downloading - >>>>>>>>>>>>>>>>>>>>>   (66%)\r'
cd $temp_dir - &> /dev/null
mv sudha$DTER.pdf .. #moving file from temp dir
cd .. #coming back to parent dir
rm -R $temp_dir > /dev/null #removing temp dir
echo -ne 'Downloading - >>>>>>>>>>>>>>>>>>>>>>> (100%)\r' #status
echo -ne '\n'
echo -ne 'Downloaded!!' #status
echo -ne '\n'

elif [ $ch = 2 ]; then
echo -e "			$yellow Mayura$nc"
temp_dir=$(mktemp -d -p ./) #creates temp dir
trap 'rm -rf -- "$temp_dir" ' EXIT #exit handler to remove temp dir in case of ctrl+c or crash 
DTER=`date +-%b` #to get month
DTE=`date  +%m01%y` #to get month and year
echo -ne 'Downloading - >>                     (10%)\r' #status
echo -ne 'Downloading - >>>                    (23%)\r' #status
sleep 5
echo -ne 'Downloading - >>>>>>                 (38%)\r' #status
sleep 8
echo -ne 'Downloading - >>>>>>>>>>>>>>>>       (55%)\r' #status
sleep 2
echo -ne 'Downloading - >>>>>>>>>>>>>>>>>      (58%)\r' #status
wget -r -np -nd -A "*.pdf" http://mayuraezine.com/Mayura_Fs/$DTE/page/ -q -P $temp_dir #to download all the files using the website -q is for silent output and *.pdf to download all pdf file from dir
echo -ne 'Downloading - >>>>>>>>>>>>>>>>>>>    (60%)\r' #status
cd $temp_dir && pdfunite $(ls -v *.pdf) mayura$DTER.pdf > /dev/null #to unite the pdf 
echo -ne 'Downloading - >>>>>>>>>>>>>>>>>>>>>   (66%)\r' #status
cd $temp_dir - &> /dev/null #cd to temp dir to get pdf
mv mayura$DTER.pdf .. #moving file from temp dir
cd ..  #coming back to parent dir
rm -R $temp_dir > /dev/null #removing temp dir
echo -ne 'Downloading - >>>>>>>>>>>>>>>>>>>>>>> (100%)\r' #status
echo -ne '\n'
echo -ne 'Downloaded!!' #status
echo -ne '\n'

elif [ $ch == 99 ]; then #choice 3
echo -e "$red Program Exit ...$nc"
sleep 0.25
exit 1
else
echo "Not Found 404 , Exit" #exit handler
exit 1
fi

