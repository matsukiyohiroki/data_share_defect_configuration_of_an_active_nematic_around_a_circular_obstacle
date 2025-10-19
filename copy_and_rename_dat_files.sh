#!/bin/bash
# copy_and_rename_dat_files.sh

###   ###
###   ### STEP 1: Get list of figure number in the paper.
###   ###
###   #source ./list_figure_numbers.txt
###   fig_number_scalar_order_parameter_passive_homeotropic="3a"
###   ###
###   ### STEP 2: Copy and rename dat files.
###   ###
###   path_to_datafile_scalar_order_parameter_passive_homeotropic="/Volumes/matsukiyo.hiroki/Documents/simulation11_Angheluta_with_viscosity_and_with_pillar/RESULTS_REV/N_480_M_1000_Delta_t_1.0e-1_Q_init_0.7071_R_0_1.0e2_bc_in_homeotropic_bc_out_parallel_to_x_axis/scalar_order_parameter_S_N_480_M_1000_Delta_t_1.0e-1_Q_init_0.7071_R_0_1.0e2_bc_in_homeotropic_bc_out_parallel_to_x_axis_step_0000200000.dat"
###   if [ ! -e ${path_to_datafile_scalar_order_parameter_passive_homeotropic} ]; then
###   	echo -e "\033[0;31m
###   	Can't find datafile.
###   	filename:
###   	${path_to_datafile_scalar_order_parameter_passive_homeotropic}
###   	\033[0;39m"
###   	exit 1
###   fi
###   mkdir -p data_files
###   cp ${path_to_datafile_scalar_order_parameter_passive_homeotropic} ./data_files/
###
###
###
### Source configuration files
source ../code/list_short_name_of_fig.txt
source ./list_fig_number_in_paper.txt
source ./list_fig_number_in_paper_converted_to_integer.txt
source ./list_skipped_fig_in_correspondence_table.txt
source ./list_figures_made_of_single_or_multiple_data_file.txt
#source ./list_data_files.txt
: > readme.md
echo "# Correspondence table between figure names, data files and scripts to create figures" >> readme.md
echo "|Figure Number|Data file (in \"data_files\" directory)|Script (in \"scripts\" directory)|" >> readme.md
echo "| ---- | ---- | ---- |" >> readme.md
for ((i=0; i<${#fig_number_in_paper_converted_to_integer[@]}; i++))
do
	for ((j=0; j<${#fig_number_in_paper_converted_to_integer[@]}; j++))
	do
		if [ -n "${fig_number_in_paper_converted_to_integer[${j}]}" ]; then
			if [ "${i}" = "${fig_number_in_paper_converted_to_integer[${j}]}" ]; then
				if [ -z "${skipped_fig_in_correspondence_table[${j}]}" ]; then
					if [ "${made_of_single_or_multiple_data_file[${j}]}" = "no" ]; then
						### Copy data file and rename
						### Output Fig Number, data file name and script name
						echo "|${fig_number_in_paper[${j}]}|${short_name_of_fig[${j}]}.dat|(script name).gp|" >> readme.md
					elif [ "${made_of_single_or_multiple_data_file[${j}]}" = "single" ]; then
						### Copy data file and rename
						### Output Fig Number, data file name and script name
						echo "|${fig_number_in_paper[${j}]}|${short_name_of_fig[${j}]}.dat|(script name).gp|" >> readme.md
					elif [ "${made_of_single_or_multiple_data_file[${j}]}" = "multiple" ]; then
						### Copy data file and rename
						### Output Fig Number, data file name and script name
						echo "|${fig_number_in_paper[${j}]}|${short_name_of_fig[${j}]}.dat|(script name).gp|" >> readme.md
					fi
				fi
			fi
		fi
	done
done
