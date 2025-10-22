#################################### Settings for terminal and output.
set terminal pdfcairo enhanced size 5in, 5in;
set output "../output_pdf_files/scalar_order_parameter_active_homeotropic_positive_alpha.pdf";
#################################### Parameters for visualization
R_0=100.0;
linewidth_defects=0.5;
xrange_r=+150.0;
xrange_l=-150.0;
yrange_t=+150.0;
yrange_b=-150.0;
r_d_over_l=R_0*(7.0/3.0)**(1.0/4.0);
set parametric;
set urange [xrange_l:xrange_r];
#################################### Settings on margin, x,yrange, title, x,ylabel, etc...
set size ratio -1;
set bmargin at screen 0.2;
set rmargin at screen 0.85;
set lmargin at screen 0.20;
set xrange [xrange_l:xrange_r];
set yrange [yrange_b:yrange_t];
set nokey;
set pm3d;
set view map;
set cbrange [0.0:sqrt(2.0)/2.0];
set cblabel "S" font "Arial,20";
set tics font "Arial,20"
set mxtics;
set mytics;
set xlabel "x" font "Arial,20";
set ylabel "y" font "Arial,20";
#################################### Settings on labels.
### Defects positions.
set label 1 right at first 1.01*xrange_l,  r_d_over_l "+(7/3)^{1/4}R_{0}" font "Arial,20";
set label 2 right at first 1.01*xrange_l, -r_d_over_l "-(7/3)^{1/4}R_{0}" font "Arial,20";
#################################### Plot
datfile = "../data_files/scalar_order_parameter_active_homeotropic_positive_alpha.dat";
splot datfile using ($1*cos($2)):($1*sin($2)):($3) with pm3d, \
u,r_d_over_l,100 lc black lw linewidth_defects,\
u,-r_d_over_l,100 lc black lw linewidth_defects;
#################################### Unset settings.
unset label 1;
unset label 2;
unset output;
unset terminal;
