% air pollution group project

% Question 1 - replicate plots
T = readtable('MOZARTT1_1.dat');

time = T(:,'time'); time = table2array(time);
class(time);

SO4 = T(:,'SO4'); SO4 = table2array(SO4);
N2O = T(:,'N2O'); N2O = table2array(N2O);
SO2 = T(:,'SO2'); SO2 = table2array(SO2);
O = T(:,'O'); O = table2array(O);
NO = T(:,'NO'); NO = table2array(NO);
NO3 = T(:,'NO3'); NO3 = table2array(NO3);

O3 = T(:,'O3'); O3 = table2array(O3);
CH2O = T(:,'CH2O'); CH2O = table2array(CH2O);
HNO3 = T(:,'HNO3'); HNO3 = table2array(HNO3);
%NOx = T();
N2O5 = T(:,'N2O5'); N2O5 = table2array(N2O5);
%NOxEMISSIONS = T(:,);
NO2 = T(:,'NO2'); NO2 = table2array(NO2);

H2O2 = T(:,'H2O2'); H2O2 = table2array(H2O2);

ISOP = T(:,'ISOP'); ISOP = table2array(ISOP);
ISOPAO2 = T(:,'ISOPAO2'); ISOPAO2 = table2array(ISOPAO2);
ISOPBO2 = T(:,'ISOPBO2'); ISOPBO2 = table2array(ISOPBO2);
ISOPOOH = T(:,'ISOPOOH'); ISOPOOH = table2array(ISOPOOH);
OH = T(:,'OH'); OH = table2array(OH);
NOx = NO+NO2;

T2 = readtable('emissions.csv');
NOx1 = T2(:,'NO'); NOx1 = table2array(NOx1);
NOx2 = T2(:,'NO2'); NOx2 = table2array(NOx2);
%NOx3 = T2(:,'NO3'); NOx3 = table2array(NOx3);
NOxEmissions = NOx1+NOx2;
time2 = T2(:,1); time2 = table2array(time2);


% reproduce case 1 - PBL diurnal evolution
clf;
figure(1);
yyaxis left; hold on
plot(time,O3*10^3,'-k'); 
ylabel('O3 (ppbv)');
yyaxis right;
plot(time,CH2O*10^3,'-g',time,HNO3*10^3,'-b',time,NO2*10^3,'--',time,N2O5*10^3,'-m',time,NOx*10^3,'-r'); 
%plot(time2,NOxEmissions*10^3,'r','linestyle','-'); hold on; % plot NOx where NOx = NO+NO2+NO3
ylabel('others (ppbv)');
xlabel('time (h)');
title('PBL Diurnal Evolution');
legend('O3','CH2O','HNO3','NO2','N2O5','NOx','NOxEmissions');
hold off;

% plot(time2,NOxEmissions,'--')
% --- need to figure this out ---

% --------------------------------------------------------------------- %

% reproduce case 2 - Urban Plume
T2 = readtable('MOZARTT1_2.dat');
time_urban = T2(:,'time'); time_urban = table2array(time_urban);
class(time);

SO4 = T2(:,'SO4'); SO4 = table2array(SO4);
N2O = T2(:,'N2O'); N2O = table2array(N2O);
SO2 = T2(:,'SO2'); SO2 = table2array(SO2);
O = T2(:,'O'); O = table2array(O);
NO_urban = T2(:,'NO'); NO_urban = table2array(NO_urban);
NO3_urban = T2(:,'NO3'); NO3_urban = table2array(NO3_urban);
O3_urban = T2(:,'O3'); O3_urban = table2array(O3_urban);
CH2O_urban = T2(:,'CH2O'); CH2O_urban = table2array(CH2O_urban);
HNO3_urban = T2(:,'HNO3'); HNO3_urban = table2array(HNO3_urban);
%NOx = T2();
N2O5 = T2(:,'N2O5'); N2O5 = table2array(N2O5);
%NOxEMISSIONS = T(:,);
NO2_urban = T2(:,'NO2'); NO2_urban = table2array(NO2_urban);
H2O2_urban = T2(:,'H2O2'); H2O2_urban = table2array(H2O2_urban);
NOx_urban = NO_urban+NO2_urban;


figure(2);
yyaxis left; hold on
plot(time_urban,O3_urban*10^3,'-k'); 
ylabel('O3 (ppbv)');
yyaxis right;
plot(time_urban,CH2O_urban*10^3,'-g',time_urban,HNO3_urban*10^3,'-b',time_urban,H2O2_urban*10^3,'-y',time_urban,NOx_urban*10^3,'-r'); 
%plot(time,(NO+NO2+NO3)*10^3,'r','linestyle','-'); hold on; % plot NOx where NOx = NO+NO2+NO3
ylabel('others (ppbv)');
xlabel('time (h)')
title('Urban Plume');
legend('O3','CH2O','HNO3','H2O2','NOx');
hold off;



% ------------------------------------------------------------------- %

% reproduce case 3 - Chamber Experiment plots
%plot(time,ISOPAO2,'g',time,ISOPBO2,'yellow',time,ISOPOOH,'r',time,OH,'k');
T3 = readtable('MOZARTT1_3.dat')
time_chamber = T3(:,'time'); time_chamber = table2array(time_chamber)*3600;

figure(3);

ISOP_chamber = T3(:,'ISOP'); ISOP_chamber = table2array(ISOP_chamber)*10^6;
ISOPAO2_chamber = T3(:,'ISOPAO2'); ISOPAO2_chamber = table2array(ISOPAO2_chamber)*10^6;
ISOPBO2_chamber = T3(:,'ISOPBO2'); ISOPBO2_chamber = table2array(ISOPBO2_chamber)*10^6;
ISOPOOH_chamber = T3(:,'ISOPOOH'); ISOPOOH_chamber = table2array(ISOPOOH_chamber)*10^6;
OH_chamber = T3(:,'OH'); OH_chamber = table2array(OH_chamber)*10^6;

yyaxis left; hold on
plot(time_chamber,ISOP_chamber,'-b'); hold on
ylabel('isoprene (pptv)');
yyaxis right;
plot(time_chamber,ISOPAO2_chamber,'-g',time_chamber,ISOPBO2_chamber,'-y',time_chamber,ISOPOOH_chamber,'-r',time_chamber,OH_chamber,'-k'); 
%plot(time,(NO+NO2+NO3)*10^3,'r','linestyle','-'); hold on; % plot NOx where NOx = NO+NO2+NO3
ylabel('others (ppqv)');
xlabel('time (s)')
title('Chamber Experiment');
legend('ISOP','ISOPAO2','ISOPBO2','ISOPOOH','OH');
%legend([ISOP_chamber,ISOPAO2_chamber,ISOPBO2_chamber,ISOPOOH_chamber,OH_chamber],cellstr(legendNames));
hold off;

