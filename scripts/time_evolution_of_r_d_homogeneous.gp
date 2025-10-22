R_0=100.0;
Delta_t=0.1;
TOTALTIMESTEP=300000;
set terminal pdfcairo enhanced size 7in, 5in;
set output "../output_pdf_files/time_evolution_of_r_d_homogeneous.pdf"
linewidth_defects=3.0;
xrange_r=TOTALTIMESTEP*Delta_t;
xrange_l=0;
yrange_t=140;
yrange_b=110;
r_d_over_l=R_0*(7.0/3.0)**(1.0/4.0);
set parametric;
set trange [xrange_l:xrange_r];
set tmargin at screen 0.92;
set rmargin at screen 0.68;
set bmargin at screen 0.15;
set lmargin at screen 0.10;
set xrange [xrange_l:xrange_r];
set yrange [yrange_b:yrange_t];
set key right outside;
set key font "Arial,23";
set xlabel "t" font "Arial,23";
set ylabel "r_{d}" font "Arial,23";
set tics font "Arial,21";
datfile0 = "../data_files/time_evolution_of_r_d_homogeneous_alpha_-1.0.dat";
datfile1 = "../data_files/time_evolution_of_r_d_homogeneous_alpha_-0.8.dat";
datfile2 = "../data_files/time_evolution_of_r_d_homogeneous_alpha_-0.6.dat";
datfile3 = "../data_files/time_evolution_of_r_d_homogeneous_alpha_-0.4.dat";
datfile4 = "../data_files/time_evolution_of_r_d_homogeneous_alpha_-0.2.dat";
datfile5 = "../data_files/time_evolution_of_r_d_homogeneous_alpha_0.2.dat";
datfile6 = "../data_files/time_evolution_of_r_d_homogeneous_alpha_0.4.dat";
datfile7 = "../data_files/time_evolution_of_r_d_homogeneous_alpha_0.6.dat";
datfile8 = "../data_files/time_evolution_of_r_d_homogeneous_alpha_0.8.dat";
datfile9 = "../data_files/time_evolution_of_r_d_homogeneous_alpha_1.0.dat";
plot \
datfile0 every ::1 using ($1*Delta_t):2 title "{/Symbol a}=-1.0", \
datfile1 every ::1 using ($1*Delta_t):2 title "{/Symbol a}=-0.8", \
datfile2 every ::1 using ($1*Delta_t):2 title "{/Symbol a}=-0.6", \
datfile3 every ::1 using ($1*Delta_t):2 title "{/Symbol a}=-0.4", \
datfile4 every ::1 using ($1*Delta_t):2 title "{/Symbol a}=-0.2", \
datfile5 every ::1 using ($1*Delta_t):2 title "{/Symbol a}=0.2", \
datfile6 every ::1 using ($1*Delta_t):2 title "{/Symbol a}=0.4", \
datfile7 every ::1 using ($1*Delta_t):2 title "{/Symbol a}=0.6", \
datfile8 every ::1 using ($1*Delta_t):2 title "{/Symbol a}=0.8", \
datfile9 every ::1 using ($1*Delta_t):2 title "{/Symbol a}=1.0", \
t,r_d_over_l lc "red" lw linewidth_defects title "r_{d}=(7/3)^{1/4}R_{0}";
unset parametric;
unset output;
unset terminal;
