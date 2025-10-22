#!/bin/bash
### Error handling for argument.
if [ $# != 1 ]; then
	echo -e "\nThe number of arguments is not correct!\nTerminate the script.\nThe number of argument of this script must be 1.\n"
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
	echo "$1"
elif [ "$1" = "velocity_on_y_axis_homeotropic_negative_alpha.gp" ]; then
	echo "$1"
elif [ "$1" = "velocity_on_y_axis_homogeneous_positive_alpha.gp" ]; then
	echo "$1"
elif [ "$1" = "velocity_on_y_axis_homogeneous_negative_alpha.gp" ]; then
	echo "$1"
else
	gnuplot -e "load '$1'"
fi
