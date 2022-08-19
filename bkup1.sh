#!/bin/bash

# script to bkup a chosen dir.. create var for the dir to add

echo -n -e "\e[93m  --Choose a directory to back up--\e[0m"
echo
rm log.txt
user=$(whoami)

ls -d /home/$user/*/ >> log.txt

cat log.txt
#2 different ways to read from log.txt.. exclude the /home/user/
#sed 's/^.\{,11\}//' log.txt  
#awk '{print substr($0,11)}' log.txt

echo -n -e "\e[93mfolder to back up.\e[0m" /home/$user/
read option
echo -n -e "\e[93myou chose directory _"$option"_ to bkup?\e[0m (y/n)"
read ans
if echo "$ans" | grep -iq "y" ;then
	#input=$option
	input=/home/${user}/$option
	output=/home/${user}/_${option}_$(date +%Y-%m-%d_%H%M%S).tar.gz
	echo $output

	tar -czf $output $input
	echo "bkup of $input done!.. Details of output bkup file:"
	ls -l $output
fi
