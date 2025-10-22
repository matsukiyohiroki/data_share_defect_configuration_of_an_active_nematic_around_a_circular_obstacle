#################################### Settings for terminal and output.
set terminal pdfcairo enhanced size 5in, 5in;
set output "../output_pdf_files/velocity_on_y_axis_homeotropic_negative_alpha.pdf";
#################################### Parameters for visualization
xrange_r=+140.0;
xrange_l=+100.0;
yrange_t=+0.003;
yrange_b=-0.010;
#################################### Settings on margin, x,yrange, title, x,ylabel, etc...
set tmargin at screen 0.92;
set bmargin at screen 0.30;
set xrange [xrange_l:xrange_r];
set yrange [yrange_b:yrange_t];
set key top left font "Arial,18";
set xlabel "y" font "Arial,18";
set ylabel "u_{r}" font "Arial,18";
set tics font "Arial,16";
#################################### Plot
datfile = "../data_files/velocity_on_y_axis_homeotropic_negative_alpha.dat";
set xzeroaxis lt -1 lw 2;
set parametric;
set trange [yrange_b:yrange_t];
plot datfile using 1:2 lc "black" pt 2 lw 3 notitle, \
	     r_d,t with lines lw 3 lc "red" title "Defect Position";
#################################### Unset settings.
unset parametric;
unset output;
unset terminal;
