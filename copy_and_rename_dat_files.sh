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
README_MD_FILE="readme.md"
DIR_DATA_FILES="data_files"
DIR_SCRIPTS="scripts"
: > ${README_MD_FILE}
rm -f ./${DIR_DATA_FILES}/*
# title of readme
echo "# Correspondence table between figure names, data files and scripts to create figures" >> ${README_MD_FILE}
# Notes on how to use scripts
echo "Notes" >> ${README_MD_FILE}
echo -e "- Please execute scripts as \`\`./script.sh output.pdf\`\`" >> ${README_MD_FILE}
echo -e "- The figures in the paper were created on Linux (Ubuntu).\n" >> ${README_MD_FILE}
# Correspondence table
echo "|Figure Number|Data file (in \"${DIR_DATA_FILES}\" directory)|Script (in \"${DIR_SCRIPTS}\" directory)|" >> ${README_MD_FILE}
echo "| ---- | ---- | ---- |" >> ${README_MD_FILE}
for ((i=0; i<${#fig_number_in_paper_converted_to_integer[@]}; i++))
do
	for ((j=0; j<${#fig_number_in_paper_converted_to_integer[@]}; j++))
	do
		if [ -n "${fig_number_in_paper_converted_to_integer[${j}]}" ]; then
			if [ "${i}" = "${fig_number_in_paper_converted_to_integer[${j}]}" ]; then
				if [ -z "${skipped_fig_in_correspondence_table[${j}]}" ]; then
					if [[ -z "${short_data_file_name[${j}]}" ]]; then
						### Copy data file and rename
						# check file existence
						### Output Fig Number, data file name and script name
						echo "|${fig_number_in_paper[${j}]}|-|${gnuplot_script_name[${j}]}|" >> ${README_MD_FILE}
					elif [[ "${short_data_file_name[${j}]}" != *$'\n'* ]]; then
						### Copy data file and rename
				#		# check file existence
				#		if [ -e ${full_data_file_name[${j}]} ]; then
				#			# copy & rename
				#			#cp ${full_data_file_name[${j}]} ./${DIR_DATA_FILES}/${short_data_file_name[${j}]}
				#		else
				#			echo "Can't find ${full_data_file_name[${j}]}"
				#			exit 1
				#		fi
						### Output Fig Number, data file name and script name
						echo "|${fig_number_in_paper[${j}]}|[${short_data_file_name[${j}]}](./${DIR_DATA_FILES}/${short_data_file_name[${j}]})|${gnuplot_script_name[${j}]}|" >> ${README_MD_FILE}
					elif [[ "${short_data_file_name[${j}]}" == *$'\n'* ]]; then
						IFS=$'\n' read -r -d '' -a multiple_dat_files <<< "${short_data_file_name[${j}]}"
						echo -n "|${fig_number_in_paper[${j}]}|" >> ${README_MD_FILE}
						for ((k=0; k<${#multiple_dat_files[@]}; k++))
						do
							# check file existence
							# copy & rename
							### Output Fig Number, data file name and script name
							if (( k == ${#multiple_dat_files[@]} -1 )); then
								echo -n "[${multiple_dat_files[${k}]}](./${DIR_DATA_FILES}/${multiple_dat_files[${k}]})" >> ${README_MD_FILE}
							else
								echo -n "[${multiple_dat_files[${k}]}](./${DIR_DATA_FILES}/${multiple_dat_files[${k}]})<br>" >> ${README_MD_FILE}
							fi
						done
						echo "|${gnuplot_script_name[${j}]}|" >> ${README_MD_FILE}
					fi
				fi
			fi
		fi
	done
done
