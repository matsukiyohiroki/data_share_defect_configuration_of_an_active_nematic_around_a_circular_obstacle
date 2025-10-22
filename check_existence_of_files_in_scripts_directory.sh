#!/bin/bash
source ./list_gnuplot_script_name.txt
for ((i=0; i<${#gnuplot_script_name[@]}; i++))
do
	if [[ -z "${gnuplot_script_name[${i}]}" ]]; then
		echo -e "\033[0;32mgnuplot_script_name[${i}] does not have any file name.\033[0;39m"
	else
		if [ -e "./scripts/${gnuplot_script_name[${i}]}" ]; then
			echo -e "\033[0;34m./scripts/${gnuplot_script_name[${i}]} exists.\033[0;39m"
		else
			echo -e "\033[0;31m./scripts/${gnuplot_script_name[${i}]} DOES NOT exist.\033[0;39m script name: ${gnuplot_script_name[${i}]}"
		fi
	fi
done
