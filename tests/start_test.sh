#!/bin/bash
INTERACTIVE=0

while getopts ":i" o
do
	case "${o}" in
		i)
			INTERACTIVE=1
			;;
		*)
			echo "option i -- make tests interactive"
			;;
	esac 
done

if [ $INTERACTIVE -eq 1 ]; then
	echo; echo "\033[32mSTART CAT TESTS\033[0m (yes/no)?"
	tmpans=''
	read 'tmpans'
	if [[ "$tmpans" == "y" || "$tmpans" == "yes" ]]
	then
		echo
		bash ./tests/test_cat.sh -s -g
	fi
else
	echo; echo -e "\033[32mSTART CAT TESTS\033[0m"
	sleep 10
	echo
	./tests/test_cat.sh -s -g
fi

if [ $INTERACTIVE -eq 1 ]; then
	echo; echo "\033[32mSTART CAT MEMORY TESTS\033[0m (yes/no)?"
	tmpans=''
	read 'tmpans'
	if [[ "$tmpans" == "y" || "$tmpans" == "yes" ]]
	then
		echo; ./tests/test_cat.sh -s -g -m valgrind
	fi
else
	echo; echo -e "\033[32mSTART CAT MEMORY TESTS\033[0m"
	sleep 10
	echo
	./tests/test_cat.sh -s -g -m valgrind -a
fi

