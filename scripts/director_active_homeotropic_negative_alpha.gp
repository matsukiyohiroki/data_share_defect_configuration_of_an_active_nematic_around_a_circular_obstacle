#################################### Settings for terminal and output.
set terminal pdfcairo enhanced size 5in, 5in;
set output "../output_pdf_files/director_active_homeotropic_negative_alpha.pdf";
#################################### Parameters for visualization
R_0=100.0;
rescale_vectorlength=10.0;
skip=10;
linewidth_defects=3;
xrange_r=+150.0;
xrange_l=-150.0;
yrange_t=+150.0;
yrange_b=-150.0;
r_d_over_l=R_0*(7.0/3.0)**(1.0/4.0);
set parametric;
set trange [xrange_l:xrange_r];
#################################### Settings on margin, x,yrange, title, x,ylabel, etc...
set size ratio -1;
set tmargin at screen 0.92;
set lmargin at screen 0.20;
set xrange [xrange_l:xrange_r];
set yrange [yrange_b:yrange_t];
set nokey;
set xlabel "x" font "Arial,20";
set ylabel "y" font "Arial,20";
set tics font "Arial,20";
#################################### Settings on labels.
### Defects positions.
set label 1 right at first 1.01*xrange_l,  r_d_over_l "+(7/3)^{1/4}R_{0}" font "Arial,20";
set label 2 right at first 1.01*xrange_l, -r_d_over_l "-(7/3)^{1/4}R_{0}" font "Arial,20";
#################################### Plot
datfile = "../data_files/director_active_homeotropic_negative_alpha.dat";
plot datfile every skip:skip using ($1-0.5*rescale_vectorlength*$3):($2-0.5*rescale_vectorlength*$4):(rescale_vectorlength*$3):(rescale_vectorlength*$4) with vector nohead linewidth 3 lc "black",\
t,+r_d_over_l lw 5 lc "red",\
t,-r_d_over_l lw 5 lc "red";
####################################
#################################### Unset settings.
unset parametric;
unset label 1;
unset label 2;
unset output;
unset terminal;
