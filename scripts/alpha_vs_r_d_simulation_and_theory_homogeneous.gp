#settings
set terminal pdfcairo;
set xzeroaxis;
set yzeroaxis;
set key right outside;
set key font "Arial,15";
set tics font "Arial,18";
set xlabel "{/Symbol a}" font "Arial,18";
set ylabel "r_{d}" font "Arial,18";
set output "../output_pdf_files/alpha_vs_r_d_simulation_and_theory_homogeneous.pdf";

plot \
	     "../data_files/r_d_bisection_method_homogeneous_lambda_1.5_nmax_0.txt" \
	     with lines lw 2 lc "red" dt 1 title "Theory, Up to n = 0", \
	     "../data_files/r_d_bisection_method_homogeneous_lambda_1.5_nmax_1.txt" \
	     with lines lw 2 lc "blue" dt '_' title "Theory, Up to n = 1", \
	     "../data_files/r_d_bisection_method_homogeneous_lambda_1.5_nmax_2.txt" \
	     with lines lw 2 lc "orange" dt '_-' title "Theory, Up to n = 2", \
	     "../data_files/r_d_bisection_method_homogeneous_lambda_1.5_nmax_3.txt" \
	     with lines lw 2 lc "dark-violet" dt '-.' title "Theory, Up to n = 3", \
	     "../data_files/alpha_vs_r_d_simulation_homogeneous_lambda_1.5.txt" \
	     with points pt 1 ps 2 lc "black" lw 2 title "Simulation", \
	     100.0*(7.0/3.0)**(1.0/4.0) with lines lw 2 lc "black" dt (5,5) title "r_{d}=(7/3)^{1/4}R_{0}";
unset output;
unset terminal;
