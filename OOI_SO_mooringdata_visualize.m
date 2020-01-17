%% Plot OOI SO data streams
%Loads in and plots data extracted from original netcdf files

%% Load data from Dropbox folder
%addpath('C:/Users/palevsky/Dropbox/SouthernOcean-OOI/OOI-SO-Extracted-Data')

load OOI_SO_dosta_Yrs1-4
load OOI_SO_nutnr_Yrs1-4
load OOI_SO_CarbonData_Yrs1-4
load OOI_SO_flortd_Yrs1-4

%% Plot O2 data without removing daytime data
figure(1); clf

plot(Yr1_sumobuoyR_dosta.time, Yr1_sumobuoyR_dosta.O2satraw, 'g.'); hold on;
plot(Yr1_sumobuoyT_dosta.time, Yr1_sumobuoyT_dosta.O2satraw, 'b.');
plot(Yr2_sumobuoyR_dosta.time, Yr2_sumobuoyR_dosta.O2satraw, 'g.');
plot(Yr2_sumobuoyT_dosta.time, Yr2_sumobuoyT_dosta.O2satraw, 'b.');
plot(Yr3_sumobuoyT_dosta.time, Yr3_sumobuoyT_dosta.O2satraw, 'b.');
plot(Yr4_sumobuoyT_dosta.time, Yr4_sumobuoyT_dosta.O2satraw, 'b.');

datetick('x',2)
title('Raw O_2 saturation data from SO OOI surface buoy')

%% Separate out day and night indices in the oxygen data
lat_sumo_SO = -54.4;
lon_sumo_SO = -89.2;
UTCoffset = 0;
tol = 4; %hrs before/after sunrise/sunset to count as daylight

[Yr1_flmA_dosta.dayind,Yr1_flmA_dosta.nightind] = indexDayNight(lat_sumo_SO,lon_sumo_SO,UTCoffset,Yr1_flmA_dosta.time,tol);
[Yr2_flmA_dosta.dayind,Yr2_flmA_dosta.nightind] = indexDayNight(lat_sumo_SO,lon_sumo_SO,UTCoffset,Yr2_flmA_dosta.time,tol);
[Yr3_flmA_dosta.dayind,Yr3_flmA_dosta.nightind] = indexDayNight(lat_sumo_SO,lon_sumo_SO,UTCoffset,Yr3_flmA_dosta.time,tol);

[Yr1_flmB_dosta.dayind,Yr1_flmB_dosta.nightind] = indexDayNight(lat_sumo_SO,lon_sumo_SO,UTCoffset,Yr1_flmB_dosta.time,tol);
[Yr2_flmB_dosta.dayind,Yr2_flmB_dosta.nightind] = indexDayNight(lat_sumo_SO,lon_sumo_SO,UTCoffset,Yr2_flmB_dosta.time,tol);
[Yr3_flmB_dosta.dayind,Yr3_flmB_dosta.nightind] = indexDayNight(lat_sumo_SO,lon_sumo_SO,UTCoffset,Yr3_flmB_dosta.time,tol);

[Yr1_sumobuoyT_dosta.dayind,Yr1_sumobuoyT_dosta.nightind] = indexDayNight(lat_sumo_SO,lon_sumo_SO,UTCoffset,Yr1_sumobuoyT_dosta.time,tol);
[Yr2_sumobuoyT_dosta.dayind,Yr2_sumobuoyT_dosta.nightind] = indexDayNight(lat_sumo_SO,lon_sumo_SO,UTCoffset,Yr2_sumobuoyT_dosta.time,tol);
[Yr3_sumobuoyT_dosta.dayind,Yr3_sumobuoyT_dosta.nightind] = indexDayNight(lat_sumo_SO,lon_sumo_SO,UTCoffset,Yr3_sumobuoyT_dosta.time,tol);
[Yr4_sumobuoyT_dosta.dayind,Yr4_sumobuoyT_dosta.nightind] = indexDayNight(lat_sumo_SO,lon_sumo_SO,UTCoffset,Yr4_sumobuoyT_dosta.time,tol);

%% Plot oxygen data during times without sunlight

figure(2); clf
plot(Yr1_sumobuoyT_dosta.time(Yr1_sumobuoyT_dosta.nightind), Yr1_sumobuoyT_dosta.O2satraw(Yr1_sumobuoyT_dosta.nightind), 'k.'); hold on;
plot(Yr1_flmA_dosta.time(Yr1_flmA_dosta.nightind), Yr1_flmA_dosta.O2satraw(Yr1_flmA_dosta.nightind), 'b.');
plot(Yr1_flmB_dosta.time(Yr1_flmB_dosta.nightind), Yr1_flmB_dosta.O2satraw(Yr1_flmB_dosta.nightind), 'r.');

plot(Yr2_flmA_dosta.time(Yr2_flmA_dosta.nightind), Yr2_flmA_dosta.O2satraw(Yr2_flmA_dosta.nightind), 'b.');
plot(Yr3_flmA_dosta.time(Yr3_flmA_dosta.nightind), Yr3_flmA_dosta.O2satraw(Yr3_flmA_dosta.nightind), 'b.');

plot(Yr2_flmB_dosta.time(Yr2_flmB_dosta.nightind), Yr2_flmB_dosta.O2satraw(Yr2_flmB_dosta.nightind), 'r.');
plot(Yr3_flmB_dosta.time(Yr3_flmB_dosta.nightind), Yr3_flmB_dosta.O2satraw(Yr3_flmB_dosta.nightind), 'r.');

plot(Yr2_sumobuoyT_dosta.time(Yr2_sumobuoyT_dosta.nightind), Yr2_sumobuoyT_dosta.O2satraw(Yr2_sumobuoyT_dosta.nightind), 'k.');
plot(Yr3_sumobuoyT_dosta.time(Yr3_sumobuoyT_dosta.nightind), Yr3_sumobuoyT_dosta.O2satraw(Yr3_sumobuoyT_dosta.nightind), 'k.');
plot(Yr4_sumobuoyT_dosta.time(Yr4_sumobuoyT_dosta.nightind), Yr4_sumobuoyT_dosta.O2satraw(Yr4_sumobuoyT_dosta.nightind), 'k.');

ylim([70 120])
legend('SUMO buoy','flmA','flmB')
title('Southern Ocean OOI surface oxygen, night-time only')
ylabel('% oxygen saturation')
datetick('x',2)

%% Example of filtering to reduce scatter
 %Filtering to a set time period might be a good pre-processing step to
 %apply to all streams - need to further test (especially for data streams
 %where day/night filtering needs to be applied first)
figure(3); clf
y = medfilt1(Yr4_sumobuoyT_dosta.O2satraw(Yr4_sumobuoyT_dosta.nightind),600,'omitnan','truncate');
plot(Yr4_sumobuoyT_dosta.time(Yr4_sumobuoyT_dosta.nightind), Yr4_sumobuoyT_dosta.O2satraw(Yr4_sumobuoyT_dosta.nightind), 'b.'); hold on;
plot(Yr4_sumobuoyT_dosta.time(Yr4_sumobuoyT_dosta.nightind), y, 'k.'); hold on;
datetick('x',2)
legend('Raw data','Median filtered data')
title('Example of filtering to reduce scatter, with SUMO oxygen data')

%% Plot nitrate data
figure(4); clf
plot(Yr1_sumobuoy_nutnr.time, Yr1_sumobuoy_nutnr.NO3, 'k.'); hold on;
plot(Yr1_sumo12m_nutnr.time, Yr1_sumo12m_nutnr.NO3, 'r.'); hold on;
plot(Yr2_sumobuoy_nutnr.time, Yr2_sumobuoy_nutnr.NO3, 'k.'); hold on;
plot(Yr3_sumobuoy_nutnr.time, Yr3_sumobuoy_nutnr.NO3, 'k.'); hold on;
plot(Yr2_sumo12m_nutnr.time, Yr2_sumo12m_nutnr.NO3, 'r.'); hold on;
plot(Yr3_sumo12m_nutnr.time, Yr3_sumo12m_nutnr.NO3, 'r.'); hold on;
plot(Yr4_sumobuoy_nutnr.time, Yr4_sumobuoy_nutnr.NO3, 'k.'); hold on;
ylim([0 28])
datetick('x',2)
legend('sumo-surface buoy','sumo-12m','location','southwest')
title('OOI Southern Ocean - Nitrate (ISUS)')

%% Plot chlorophyll data
%Test relevance of filtering for day/night
    [Yr4_sumobuoy_flortd.dayind,Yr4_sumobuoy_flortd.nightind] = indexDayNight(lat_sumo_SO,lon_sumo_SO,3,Yr4_sumobuoy_flortd.time,tol);

figure(5); clf
plot(Yr1_sumobuoy_flortd.time, Yr1_sumobuoy_flortd.chl, 'k.'); hold on;
plot(Yr1_sumo12m_flortd.time, Yr1_sumo12m_flortd.chl, 'c.'); hold on;
plot(Yr1_flmA_flortd.time, Yr1_flmA_flortd.chl, 'r.'); hold on;
plot(Yr1_flmB_flortd.time, Yr1_flmB_flortd.chl, 'b.'); hold on;
plot(Yr2_sumobuoy_flortd.time, Yr2_sumobuoy_flortd.chl, 'k.'); hold on;
plot(Yr2_sumo12m_flortd.time, Yr2_sumo12m_flortd.chl, 'c.'); hold on;
plot(Yr2_flmA_flortd.time, Yr2_flmA_flortd.chl, 'r.'); hold on;
plot(Yr2_flmB_flortd.time, Yr2_flmB_flortd.chl, 'b.'); hold on;
plot(Yr3_sumo12m_flortd.time, Yr3_sumo12m_flortd.chl, 'c.'); hold on;
plot(Yr4_sumobuoy_flortd.time, Yr4_sumobuoy_flortd.chl, 'k.'); hold on;
plot(Yr4_sumobuoy_flortd.time(Yr4_sumobuoy_flortd.nightind), Yr4_sumobuoy_flortd.chl(Yr4_sumobuoy_flortd.nightind), 'k.'); hold on;
datetick('x',2)
legend('SUMO buoy','SUMO 12 m','flmA','flmB')
ylim([0 10])
title('OOI Southern Ocean surface chlorophyll from fluorescence')
ylabel('\mug/L')

%% Plot SAMI pH data

figure(6); clf
plot(Yr1_sumo20m_phsen.time, Yr1_sumo20m_phsen.pH, 'k.'); hold on;
plot(Yr1_flmA_phsen.time, Yr1_flmA_phsen.pH, 'r.'); hold on;
plot(Yr1_flmB_phsen.time, Yr1_flmB_phsen.pH, 'b.'); hold on;
plot(Yr2_sumo20m_phsen.time, Yr2_sumo20m_phsen.pH, 'k.'); hold on;
%plot(Yr2_flmA_phsen.time, Yr2_flmA_phsen.pH, 'r.'); hold on;
plot(Yr2_flmB_phsen.time, Yr2_flmB_phsen.pH, 'b.'); hold on;
%plot(Yr2_sumo100m_phsen.time, Yr2_sumo100m_phsen.pH, 'm.'); hold on;
plot(Yr3_flmA_phsen.time, Yr3_flmA_phsen.pH, 'r.'); hold on;
plot(Yr3_flmB_phsen.time, Yr3_flmB_phsen.pH, 'b.'); hold on;
plot(Yr4_sumo20m_phsen.time, Yr4_sumo20m_phsen.pH, 'k.'); hold on;
datetick('x',2)
ylim([8.04 8.12])
legend('sumo-20m','flmA','flmB')
title('OOI Southern Ocean - pH (SAMI)')

%% Plot SAMI pCO2 data
figure(7); clf
%     subplot(2,2,[1,2])
% plot(Yr1_sumo12m_pco2w.time, Yr1_sumo12m_pco2w.pCO2, 'k.'); hold on;
% %plot(Yr2_sumo40m_pco2w.time, Yr2_sumo40m_pco2w.pCO2, 'm.'); hold on;
% %plot(Yr2_sumo80m_pco2w.time, Yr2_sumo80m_pco2w.pCO2, 'c.'); hold on;
% %plot(Yr2_sumo130m_pco2w.time, Yr2_sumo130m_pco2w.pCO2, 'g.'); hold on;
% plot(Yr2_sumo12m_pco2w.time, Yr2_sumo12m_pco2w.pCO2, 'k.'); hold on;
% plot(Yr4_sumo12m_pco2w.time, Yr4_sumo12m_pco2w.pCO2, 'k.'); hold on;
% ylim([0 700])
% %legend('12 m','40 m','80 m', '130m','location','northwest')
% title('SAMI pCO_2, near-surface instrument frame (12 m)')
% datetick('x',2)
% ylabel('\muatm')
    subplot(2,2,1)
plot(Yr2_sumo12m_pco2w.time, Yr2_sumo12m_pco2w.pCO2, 'k.'); hold on;
ylim([300 400])
title('Y2 SAMI pCO_2 (12 m)')
datetick('x',2)
xlim([datenum(2015,12,1) datenum(2016,12,1)])
ylabel('\muatm')
    subplot(2,2,2)
plot(Yr4_sumo12m_pco2w.time, Yr4_sumo12m_pco2w.pCO2, 'k.'); hold on;
ylim([300 600])
title('Y4 SAMI pCO_2 (12 m)')
datetick('x',2)
xlim([datenum(2018,12,1) datenum(2020,1,1)])
ylabel('\muatm')
    subplot(2,2,3)
plot(Yr2_sumo12m_pco2w.time, Yr2_sumo12m_pco2w.pCO2, 'k.'); hold on;
title('Y2 SAMI pCO_2 (12 m) subset zoom')
xlim([datenum(2016,4,1) datenum(2016,6,1)])
datetick('x',2,'keeplimits')
%ylim([300 400])
ylabel('\muatm')
    subplot(2,2,4)
plot(Yr4_sumo12m_pco2w.time, Yr4_sumo12m_pco2w.pCO2, 'k.'); hold on;
ylim([350 550])
title('Y4 SAMI pCO_2 (12 m) subset zoom')
xlim([datenum(2019,7,1) datenum(2019,9,1)])
datetick('x',2,'keeplimits')
ylabel('\muatm')
%     subplot(212)
% plot(Yr1_sumo12m_pco2w.time, Yr1_sumo12m_pco2w.absorbance_blank_434, 'k.'); hold on;
% plot(Yr2_sumo12m_pco2w.time, Yr2_sumo12m_pco2w.absorbance_blank_434, 'k.'); hold on;
% plot(Yr4_sumo12m_pco2w.time, Yr4_sumo12m_pco2w.absorbance_blank_434, 'k.'); hold on;
% plot(Yr2_sumo40m_pco2w.time, Yr2_sumo40m_pco2w.absorbance_blank_434, 'm.'); hold on;
% plot(Yr2_sumo80m_pco2w.time, Yr2_sumo80m_pco2w.absorbance_blank_434, 'c.'); hold on;
% plot(Yr2_sumo130m_pco2w.time, Yr2_sumo130m_pco2w.absorbance_blank_434, 'g.'); hold on;
% datetick('x',2)

%% Plot Pro-Oceanus pCO2 data
figure(8); clf

subplot(3,1,1)
for i = 1:length(Yr1_pco2aa)
    plot(Yr1_pco2aa(i).time, Yr1_pco2aa(i).pCO2_ssw, 'k.'); hold on;
    plot(Yr1_pco2aa(i).time, Yr1_pco2aa(i).pCO2_atm, 'r.'); hold on;
end
xlim([datenum(2015,2,22) datenum(2015,4,22)])
datetick('x',2,'keeplimits')
ylim([370 450])
title('Year 1 Pro-Oceanus pCO_2')

subplot(3,1,2)
for i = 1:length(Yr2_pco2aa)
    plot(Yr2_pco2aa(i).time, Yr2_pco2aa(i).pCO2_ssw, 'k.'); hold on;
    plot(Yr2_pco2aa(i).time, Yr2_pco2aa(i).pCO2_atm, 'r.'); hold on;
end
xlim([datenum(2015,12,1) datenum(2016,10,1)])
datetick('x',2,'keeplimits')
ylim([250 350])
title('Year 2 Pro-Oceanus pCO_2')

subplot(3,1,3)
for i = 1:length(Yr4_pco2aa)
    plot(Yr4_pco2aa(i).time, Yr4_pco2aa(i).pCO2_ssw, 'k.'); hold on;
    plot(Yr4_pco2aa(i).time, Yr4_pco2aa(i).pCO2_atm, 'r.'); hold on;
end
xlim([datenum(2018,12,1) datenum(2019,4,15)])
datetick('x',2,'keeplimits')
ylim([350 410])
title('Year 4 Pro-Oceanus pCO_2')
