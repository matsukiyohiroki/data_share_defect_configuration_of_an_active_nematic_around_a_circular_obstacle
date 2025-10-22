#!/bin/bash
### Error handling for argument.
if [ $# != 1 ]; then
	echo "
	The number of arguments is not correct!
	Terminate the script.
	The number of argument of this script must be 1.
	"
	exit 1
fi
if [ ! -e "./$1" ]; then
	echo -e "\nCannot find the file \"$1\".\nTerminate the script.\n"
	exit 1
fi
### Make directory to store the output pdf file
mkdir -p ../output_pdf_files
### Execute gnuplot script
if [ "$1" = "velocity_on_y_axis_homeotropic_positive_alpha.gp" ]; then
	simulation_r_d_dat_file="../data_files/time_evolution_of_r_d_homeotropic_positive_alpha.dat"
	lastline=`tail -1 ${simulation_r_d_dat_file}`
	r_d=`echo ${lastline} | cut -f 2 -d " "`
	gnuplot -e "
	r_d=${r_d};
	load '$1';
	"
elif [ "$1" = "velocity_on_y_axis_homeotropic_negative_alpha.gp" ]; then
	simulation_r_d_dat_file="../data_files/time_evolution_of_r_d_homeotropic_negative_alpha.dat"
	lastline=`tail -1 ${simulation_r_d_dat_file}`
	r_d=`echo ${lastline} | cut -f 2 -d " "`
	gnuplot -e "
	r_d=${r_d};
	load '$1';
	"
elif [ "$1" = "velocity_on_y_axis_homogeneous_positive_alpha.gp" ]; then
	simulation_r_d_dat_file="../data_files/time_evolution_of_r_d_homogeneous_positive_alpha.dat"
	lastline=`tail -1 ${simulation_r_d_dat_file}`
	r_d=`echo ${lastline} | cut -f 2 -d " "`
	gnuplot -e "
	r_d=${r_d};
	load '$1';
	"
elif [ "$1" = "velocity_on_y_axis_homogeneous_negative_alpha.gp" ]; then
	simulation_r_d_dat_file="../data_files/time_evolution_of_r_d_homogeneous_negative_alpha.dat"
	lastline=`tail -1 ${simulation_r_d_dat_file}`
	r_d=`echo ${lastline} | cut -f 2 -d " "`
	gnuplot -e "
	r_d=${r_d};
	load '$1';
	"
else
	gnuplot -e "load '$1'"
fi
