#!/bin/bash
source ./list_short_data_file_name.txt
for ((i=0; i<${#short_data_file_name[@]}; i++))
do
	if [[ -z "${short_data_file_name[${i}]}" ]]; then
		echo -e "\033[0;32mfull_data_file_name[${i}] does not have any file name.\033[0;39m"
	elif [[ "${short_data_file_name[${i}]}" != *$'\n'* ]]; then
		if [ -e "./data_files/${short_data_file_name[${i}]}" ]; then
			echo -e "\033[0;34m./data_files/${short_data_file_name[${i}]} exists.\033[0;39m"
		else
			echo -e "\033[0;31m./data_files/${short_data_file_name[${i}]} DOES NOT exist.\033[0;39m dat file name: ${short_data_file_name[${i}]}"
		fi
	elif [[ "${short_data_file_name[${i}]}" == *$'\n'* ]]; then
		echo "short_data_file_name[${i}] contains multiple file names. I will check the existence of each file."
		IFS=$'\n' read -r -d '' -a multiple_dat_files <<< "${short_data_file_name[${i}]}"
		for ((k=0; k<${#multiple_dat_files[@]}; k++))
		do
			if [ -e "./data_files/${multiple_dat_files[${k}]}" ]; then
				echo -e "\033[0;34m${k}th file of short_data_file_name[${i}] exists.\033[0;39m"
			else
				echo -e "\033[0;31m${k}th file of short_data_file_name[${i}] DOES NOT exist.\033[0;39m dat file name: ${multiple_dat_files[${k}]}"
			fi
		done
	fi
done
