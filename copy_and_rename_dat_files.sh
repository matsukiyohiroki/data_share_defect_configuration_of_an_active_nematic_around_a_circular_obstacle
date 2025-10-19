#!/bin/bash
# copy_and_rename_dat_files.sh

### Source configuration files
sourced_files=()
sourced_files+=("../code/list_short_name_of_fig.txt")
sourced_files+=("./list_fig_number_in_paper.txt")
sourced_files+=("./list_fig_number_in_paper_converted_to_integer.txt")
sourced_files+=("./list_skipped_fig_in_correspondence_table.txt")
sourced_files+=("./list_figures_made_of_single_or_multiple_data_file.txt")
sourced_files+=("./list_gnuplot_script_name.txt")
sourced_files+=("./list_short_data_file_name.txt")
sourced_files+=("./list_full_data_file_name.txt")
for sourced_file in ${sourced_files[@]}
do
	if [ -e ${sourced_file} ]; then source ${sourced_file}; else echo "Can't find ${sourced_file}. Terminate the script."; exit 1;fi
done
### Clean readme.md and data_files/
: > readme.md
rm -f ./data_files/*
echo "# Correspondence table between figure names, data files and scripts to create figures" >> readme.md
echo "|Figure Number|Data file (in \"data_files\" directory)|Script (in \"scripts\" directory)|How to execute gp script|" >> readme.md
echo "| ---- | ---- | ---- | ---- |" >> readme.md
for ((i=0; i<${#fig_number_in_paper_converted_to_integer[@]}; i++))
do
	for ((j=0; j<${#fig_number_in_paper_converted_to_integer[@]}; j++))
	do
		if [ -n "${fig_number_in_paper_converted_to_integer[${j}]}" ]; then
			if [ "${i}" = "${fig_number_in_paper_converted_to_integer[${j}]}" ]; then
				if [ -z "${skipped_fig_in_correspondence_table[${j}]}" ]; then
					if [[ -z "${full_data_file_name[${j}]}" ]]; then
						### Copy data file and rename
						# check file existence
						### Output Fig Number, data file name and script name
						echo "|${fig_number_in_paper[${j}]}|-|${gnuplot_script_name[${j}]}||" >> readme.md
					elif [[ "${full_data_file_name[${j}]}" != *$'\n'* ]]; then
						### Copy data file and rename
						# check file existence & copy & rename
						if [ -n "${full_data_file_name[${j}]}" ]; then
							if [ -e ${full_data_file_name[${j}]} ]; then
								cp ${full_data_file_name[${j}]} ./data_files/${short_data_file_name[${j}]}
							else
								echo "Can't find ${full_data_file_name[${j}]}"
								exit 1
							fi
						fi
						### Output Fig Number, data file name and script name
						echo "|${fig_number_in_paper[${j}]}|[${short_data_file_name[${j}]}](./data_files/${short_data_file_name[${j}]})|${gnuplot_script_name[${j}]}||" >> readme.md
					elif [ "${full_data_file_name[${j}]}" == *$'\n'* ]; then
						### Copy data file and rename
						# check file existence
						### Output Fig Number, data file name and script name
						echo "|${fig_number_in_paper[${j}]}|${short_data_file_name[${j}]}|${gnuplot_script_name[${j}]}||" >> readme.md
					fi
				fi
			fi
		fi
	done
done
