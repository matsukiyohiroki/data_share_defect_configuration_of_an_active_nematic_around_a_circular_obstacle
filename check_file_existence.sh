#!/bin/bash
source ./list_full_data_file_name.txt
for ((i=0; i<${#full_data_file_name[@]}; i++))
do
	if [[ -z "${full_data_file_name[${i}]}" ]]; then
		echo -e "\033[0;32mfull_data_file_name[${i}] does not have any file name.\033[0;39m"
	elif [[ "${full_data_file_name[${i}]}" != *$'\n'* ]]; then
		if [ -e ${full_data_file_name[${i}]} ]; then
			echo -e "\033[0;34mfull_data_file_name[${i}] exists.\033[0;39m"
		else
			echo -e "\033[0;31mfull_data_file_name[${i}] DOES NOT exist.\033[0;39m Full dat file name: ${full_data_file_name[${i}]}"
		fi
	elif [[ "${full_data_file_name[${i}]}" == *$'\n'* ]]; then
		echo "full_data_file_name[${i}] contains multiple file names. I will check the existence of each file."
		IFS=$'\n' read -r -d '' -a multiple_dat_files <<< "${full_data_file_name[${i}]}"
		for ((k=0; k<${#multiple_dat_files[@]}; k++))
		do
			if [ -e ${multiple_dat_files[${k}]} ]; then
				echo -e "\033[0;34m${k}th file of full_data_file_name[${i}] exists.\033[0;39m"
			else
				echo -e "\033[0;31m${k}th file of full_data_file_name[${i}] DOES NOT exist.\033[0;39m Full dat file name: ${multiple_dat_files[${k}]}"
			fi
		done
	fi
done
