%% Code to extract relevant variables from OOI Southern Ocean mooring data files

%% Add path of OOI data
addpath(genpath('C:/Users/palevsky/Dropbox/SouthernOcean-OOI/OOI-downloads'))

%% Add path of OOI Irminger repository for relevant functions
%addpath('C:/Users/palevsky/Dropbox/MATLAB/OOI data processing/OOI_Irminger')

%% Extract all pH sensor data
Yr1_sumo20m_phsen = OOI_phsen_extract('deployment0001_GS01SUMO-RII11-02-PHSENE041-recovered_inst-phsen_abcdef_instrument_20150218T215959-20150703T015959.nc');
Yr1_flmA_phsen = OOI_phsen_extract('deployment0001_GS03FLMA-RIS01-04-PHSENF000-recovered_inst-phsen_abcdef_instrument_20150226T120000-20151218T115959.nc');
Yr1_flmB_phsen = OOI_phsen_extract('deployment0001_GS03FLMB-RIS01-04-PHSENF000-recovered_inst-phsen_abcdef_instrument_20150224T120000-20151219T175959.nc');  

Yr2_sumo20m_phsen = OOI_phsen_extract('deployment0002_GS01SUMO-RII11-02-PHSENE041-recovered_inst-phsen_abcdef_instrument_20151214T205959-20160224T145959.nc');
Yr2_sumo100m_phsen = OOI_phsen_extract('deployment0002_GS01SUMO-RII11-02-PHSENE042-recovered_inst-phsen_abcdef_instrument_20151214T205959-20160427T085959.nc');
Yr2_flmA_phsen = OOI_phsen_extract('deployment0002_GS03FLMA-RIS01-04-PHSENF000-recovered_inst-phsen_abcdef_instrument_20151217T200000-20161206T075959.nc');
Yr2_flmB_phsen = OOI_phsen_extract('deployment0002_GS03FLMB-RIS01-04-PHSENF000-recovered_inst-phsen_abcdef_instrument_20151216T200000-20161205T095959.nc');

Yr3_flmA_phsen = OOI_phsen_extract('deployment0003_GS03FLMA-RIS01-04-PHSENF000-recovered_inst-phsen_abcdef_instrument_20161202T000000-20171203T155959.nc');
Yr3_flmB_phsen = OOI_phsen_extract('deployment0003_GS03FLMB-RIS01-04-PHSENF000-recovered_inst-phsen_abcdef_instrument_20161204T000000-20171203T115959.nc');
Yr4_sumo20m_phsen = OOI_phsen_extract('deployment0004_GS01SUMO-RII11-02-PHSENE041-telemetered-phsen_abcdef_imodem_instrument_20181204T210000-20181205T175959.nc');

%% Extract all SAMI-pCO2 sensor data

%Yr2_sumo40m_pco2w = OOI_pco2w_extract('deployment0002_GS01SUMO-RII11-02-PCO2WC051-recovered_host-pco2w_abc_imodem_instrument_recovered_20151217T110009-20160706T110009.nc');
%Yr2_sumo80m_pco2w = OOI_pco2w_extract('deployment0002_GS01SUMO-RII11-02-PCO2WC052-recovered_host-pco2w_abc_imodem_instrument_recovered_20151214T210009-20160112T150009.nc');
%Yr2_sumo130m_pco2w = OOI_pco2w_extract('deployment0002_GS01SUMO-RII11-02-PCO2WC053-recovered_host-pco2w_abc_imodem_instrument_recovered_20151214T210009-20160229T190009.nc');
    %Note that files downloaded before OOI internal processing code was
    %corrected for PCO2W processing to be done correctly (code was updated
    %in Mar 2018 but something changed after?)
    
Yr1_sumo12m_pco2w = OOI_pco2w_extract('deployment0001_GS01SUMO-RID16-05-PCO2WB000-telemetered-pco2w_abc_dcl_instrument_20150218T220513.709000-20151222T180735.451000.nc');
Yr2_sumo12m_pco2w = OOI_pco2w_extract('deployment0002_GS01SUMO-RID16-05-PCO2WB000-telemetered-pco2w_abc_dcl_instrument_20151214T220510.207000-20161126T100546.693000.nc');
Yr4_sumo12m_pco2w = OOI_pco2w_extract('deployment0004_GS01SUMO-RID16-05-PCO2WB000-telemetered-pco2w_abc_dcl_instrument_20181204T180004.474000-20191223T140532.300000.nc');

%% Extract pro-Oceanus air-sea pCO2 data
Yr1_files = {'deployment0001_GS01SUMO-SBD12-04-PCO2AA000-telemetered-pco2a_a_dcl_instrument_water_20150225T032314.745000-20150322T233222.427000.nc';
    'deployment0001_GS01SUMO-SBD12-04-PCO2AA000-telemetered-pco2a_a_dcl_instrument_water_20150323T003211.918000-20150419T234204.082000.nc';
    'deployment0001_GS01SUMO-SBD12-04-PCO2AA000-telemetered-pco2a_a_dcl_instrument_water_20150420T004153.584000-20150517T235146.099000.nc';
    'deployment0001_GS01SUMO-SBD12-04-PCO2AA000-telemetered-pco2a_a_dcl_instrument_water_20150518T005155.562000-20150610T232428.986000.nc'};

Yr2_files = {'deployment0002_GS01SUMO-SBD12-04-PCO2AA000-telemetered-pco2a_a_dcl_instrument_water_20151214T202955.033000-20151227T235955.166000.nc';
    'deployment0002_GS01SUMO-SBD12-04-PCO2AA000-telemetered-pco2a_a_dcl_instrument_water_20151228T002948.896000-20160124T235943.886000.nc';
    'deployment0002_GS01SUMO-SBD12-04-PCO2AA000-telemetered-pco2a_a_dcl_instrument_water_20160125T002936.543000-20160221T235932.078000.nc';
    'deployment0002_GS01SUMO-SBD12-04-PCO2AA000-telemetered-pco2a_a_dcl_instrument_water_20160222T002945.817000-20160320T235920.332000.nc';
    'deployment0002_GS01SUMO-SBD12-04-PCO2AA000-telemetered-pco2a_a_dcl_instrument_water_20160321T002914.046000-20160417T235908.232000.nc';
    'deployment0002_GS01SUMO-SBD12-04-PCO2AA000-telemetered-pco2a_a_dcl_instrument_water_20160418T002901.970000-20160515T235856.024000.nc';
    'deployment0002_GS01SUMO-SBD12-04-PCO2AA000-telemetered-pco2a_a_dcl_instrument_water_20160516T002909.760000-20160612T235843.814000.nc';
    'deployment0002_GS01SUMO-SBD12-04-PCO2AA000-telemetered-pco2a_a_dcl_instrument_water_20160613T002837.555000-20160710T235831.330000.nc';
    'deployment0002_GS01SUMO-SBD12-04-PCO2AA000-telemetered-pco2a_a_dcl_instrument_water_20160711T002825.066000-20160807T235818.783000.nc';
    'deployment0002_GS01SUMO-SBD12-04-PCO2AA000-telemetered-pco2a_a_dcl_instrument_water_20160808T002832.417000-20160904T235805.941000.nc';
    'deployment0002_GS01SUMO-SBD12-04-PCO2AA000-telemetered-pco2a_a_dcl_instrument_water_20160905T002759.677000-20161002T235753.207000.nc';
    'deployment0002_GS01SUMO-SBD12-04-PCO2AA000-telemetered-pco2a_a_dcl_instrument_water_20161003T002746.967000-20161030T235740.608000.nc';
    'deployment0002_GS01SUMO-SBD12-04-PCO2AA000-telemetered-pco2a_a_dcl_instrument_water_20161031T002754.352000-20161127T235728.222000.nc';
    'deployment0002_GS01SUMO-SBD12-04-PCO2AA000-telemetered-pco2a_a_dcl_instrument_water_20161128T002721.960000-20161205T085725.075000.nc'};

Yr4_files = {'deployment0004_GS01SUMO-SBD12-04-PCO2AA000-telemetered-pco2a_a_dcl_instrument_water_20181204T175942.409000-20181223T225915.904000.nc';
    'deployment0004_GS01SUMO-SBD12-04-PCO2AA000-telemetered-pco2a_a_dcl_instrument_water_20181224T015902.922000-20190120T235818.434000.nc';
    'deployment0004_GS01SUMO-SBD12-04-PCO2AA000-telemetered-pco2a_a_dcl_instrument_water_20190121T005805.554000-20190217T235740.507000.nc';
    'deployment0004_GS01SUMO-SBD12-04-PCO2AA000-telemetered-pco2a_a_dcl_instrument_water_20190218T005707.759000-20190317T235925.195000.nc';
    'deployment0004_GS01SUMO-SBD12-04-PCO2AA000-telemetered-pco2a_a_dcl_instrument_water_20190318T005912.334000-20190411T105509.236000.nc'};

Yr1_pco2aa = OOI_pco2aa_extract(Yr1_files{1});
for i = 2:length(Yr1_files)
    Yr1_pco2aa = [Yr1_pco2aa, OOI_pco2aa_extract(Yr1_files{i})];
end

Yr2_pco2aa = OOI_pco2aa_extract(Yr2_files{1});
for i = 2:length(Yr2_files)
    Yr2_pco2aa = [Yr2_pco2aa, OOI_pco2aa_extract(Yr2_files{i})];
end

Yr4_pco2aa = OOI_pco2aa_extract(Yr4_files{1});
for i = 2:length(Yr4_files)
    Yr4_pco2aa = [Yr4_pco2aa, OOI_pco2aa_extract(Yr4_files{i})];
end

%% Extract nitrate data
Yr1_sumobuoy_nutnr = OOI_nutnr_extract('deployment0001_GS01SUMO-SBD11-08-NUTNRB000-recovered_inst-nutnr_b_instrument_recovered_20150218T220528-20151227T110535.nc');
Yr2_sumobuoy_nutnr = OOI_nutnr_extract('deployment0002_GS01SUMO-SBD11-08-NUTNRB000-recovered_inst-nutnr_b_instrument_recovered_20151214T203028-20161212T074531.nc');
Yr3_sumobuoy_nutnr = OOI_nutnr_extract('deployment0003_GS01SUMO-SBD11-08-NUTNRB000-telemetered-nutnr_b_dcl_full_instrument_20161125T020027.831000-20180215T180004.045000.nc');
Yr4_sumobuoy_nutnr = OOI_nutnr_extract('deployment0004_GS01SUMO-SBD11-08-NUTNRB000-telemetered-suna_dcl_recovered_20181204T171525.906000-20191220T150303.970000.nc');
Yr1_sumo12m_nutnr = OOI_nutnr_extract('deployment0001_GS01SUMO-RID16-07-NUTNRB000-recovered_inst-nutnr_b_instrument_recovered_20150218T220527-20151227T110534.nc');
Yr2_sumo12m_nutnr = OOI_nutnr_extract('deployment0002_GS01SUMO-RID16-07-NUTNRB000-recovered_inst-nutnr_b_instrument_recovered_20151214T210028-20161212T070040.nc');
Yr3_sumo12m_nutnr = OOI_nutnr_extract('deployment0003_GS01SUMO-RID16-07-NUTNRB000-telemetered-nutnr_b_dcl_full_instrument_20161125T020026.689000-20171025T020013.051000.nc');

%% Extract oxygen data

Yr1_flmA_dosta = OOI_dosta_extract('deployment0001_GS03FLMA-RIS01-03-DOSTAD000-recovered_host-dosta_abcdjm_sio_instrument_recovered_20150226T000001-20151110T054501.nc');
Yr2_flmA_dosta = OOI_dosta_extract('deployment0002_GS03FLMA-RIS01-03-DOSTAD000-recovered_host-dosta_abcdjm_sio_instrument_recovered_20151217T194501-20161206T093001.nc');
Yr3_flmA_dosta = OOI_dosta_extract('deployment0003_GS03FLMA-RIS01-03-DOSTAD000-recovered_host-dosta_abcdjm_sio_instrument_recovered_20161201T193001-20170429T123001.nc');

Yr1_flmB_dosta = OOI_dosta_extract('deployment0001_GS03FLMB-RIS01-03-DOSTAD000-recovered_host-dosta_abcdjm_sio_instrument_recovered_20150223T203001-20151026T123001.nc');
Yr2_flmB_dosta = OOI_dosta_extract('deployment0002_GS03FLMB-RIS01-03-DOSTAD000-recovered_host-dosta_abcdjm_sio_instrument_recovered_20151216T194501-20160611T010001.nc');
Yr3_flmB_dosta = OOI_dosta_extract('deployment0003_GS03FLMB-RIS01-03-DOSTAD000-recovered_host-dosta_abcdjm_sio_instrument_recovered_20161203T191501-20170331T231501.nc');

%Note that Yrs 3 and 4 only have telemetered data available as of 7 Mar 2019
Yr1_sumobuoyR_dosta = OOI_dosta_extract('deployment0001_GS01SUMO-SBD11-04-DOSTAD000-recovered_host-dosta_abcdjm_dcl_instrument_recovered_20150218T211512.761000-20151223T234804.379000.nc');
Yr1_sumobuoyT_dosta = OOI_dosta_extract('deployment0001_GS01SUMO-SBD11-04-DOSTAD000-telemetered-dosta_abcdjm_dcl_instrument_20150218T211512.761000-20151222T181524.720000.nc');
Yr2_sumobuoyR_dosta = OOI_dosta_extract('deployment0002_GS01SUMO-SBD11-04-DOSTAD000-recovered_host-dosta_abcdjm_dcl_instrument_recovered_20151214T203012.971000-20161127T070029.884000.nc');
Yr2_sumobuoyT_dosta = OOI_dosta_extract('deployment0002_GS01SUMO-SBD11-04-DOSTAD000-telemetered-dosta_abcdjm_dcl_instrument_20151214T203012.971000-20161127T070029.884000.nc');
Yr3_sumobuoyT_dosta = OOI_dosta_extract('deployment0003_GS01SUMO-SBD11-04-DOSTAD000-telemetered-dosta_abcdjm_dcl_instrument_20161125T011511.156000-20181209T163304.222000.nc');
%Yr4_sumobuoyT_dosta = OOI_dosta_extract('deployment0004_GS01SUMO-SBD11-04-DOSTAD000-telemetered-dosta_abcdjm_dcl_instrument_20181204T171514.806000-20190307T120319.527000.nc');
Yr4_sumobuoyT_dosta = OOI_dosta_extract('deployment0004_GS01SUMO-SBD11-04-DOSTAD000-telemetered-dosta_abcdjm_dcl_instrument_20181204T171514.806000-20191220T150319.688000.nc');

Yr1_sumo12mR_dosta = OOI_dosta_extract('deployment0001_GS01SUMO-RID16-06-DOSTAD000-recovered_host-dosta_abcdjm_dcl_instrument_recovered_20150218T211511.267000-20151227T053227.437000.nc');

%% Extract chlorophyll and backscatter data

Yr1_sumo12m_flortd = OOI_flortd_extract('deployment0001_GS01SUMO-RID16-02-FLORTD000-telemetered-flort_sample_20150218T211514.462000-20150825T001716.291000.nc');
Yr1_sumobuoy_flortd = OOI_flortd_extract('deployment0001_GS01SUMO-SBD12-02-FLORTD000-telemetered-flort_sample_20150218T211515.705000-20151222T180301.998000.nc');
Yr1_flmA_flortd = OOI_flortd_extract('deployment0001_GS03FLMA-RIS01-05-FLORTD000-recovered_host-flort_sample_20150226T000001-20151110T054501.nc');
Yr1_flmB_flortd = OOI_flortd_extract('deployment0001_GS03FLMB-RIS01-05-FLORTD000-recovered_host-flort_sample_20150223T210001-20151026T123001.nc');

Yr2_sumo12m_flortd = OOI_flortd_extract('deployment0002_GS01SUMO-RID16-02-FLORTD000-telemetered-flort_sample_20151214T203013.994000-20161205T090304.724000.nc');
Yr2_sumobuoy_flortd = OOI_flortd_extract('deployment0002_GS01SUMO-SBD12-02-FLORTD000-telemetered-flort_sample_20151214T203017.112000-20161205T090301.799000.nc');
Yr2_flmA_flortd = OOI_flortd_extract('deployment0002_GS03FLMA-RIS01-05-FLORTD000-recovered_host-flort_sample_20151217T194501-20161206T093001.nc');
Yr2_flmB_flortd = OOI_flortd_extract('deployment0002_GS03FLMB-RIS01-05-FLORTD000-recovered_host-flort_sample_20151216T194501-20160611T010001.nc');

Yr3_sumo12m_flortd = OOI_flortd_extract('deployment0003_GS01SUMO-RID16-02-FLORTD000-telemetered-flort_sample_20161125T011513.765000-20180410T234805.303000.nc');
Yr4_sumobuoy_flortd = OOI_flortd_extract('deployment0004_GS01SUMO-SBD12-02-FLORTD000-telemetered-flort_sample_20181204T171515.028000-20191218T211800.870000.nc');

%% Save extracted data for later use
save OOI_SO_CarbonData_Yrs1-4 Yr1_pco2aa Yr2_pco2aa Yr4_pco2aa ...
    Yr1_sumo12m_pco2w Yr2_sumo12m_pco2w Yr4_sumo12m_pco2w ...
    Yr1_sumo20m_phsen Yr2_sumo20m_phsen Yr4_sumo20m_phsen ...
    Yr1_flmA_phsen Yr2_flmA_phsen Yr3_flmA_phsen ...
    Yr1_flmB_phsen Yr2_flmB_phsen Yr3_flmB_phsen

save OOI_SO_nutnr_Yrs1-4 ...
    Yr1_sumobuoy_nutnr Yr2_sumobuoy_nutnr Yr3_sumobuoy_nutnr Yr4_sumobuoy_nutnr ...
    Yr1_sumo12m_nutnr Yr2_sumo12m_nutnr Yr3_sumo12m_nutnr

save OOI_SO_dosta_Yrs1-4 ...
    Yr1_flmA_dosta Yr2_flmA_dosta Yr3_flmA_dosta ...
    Yr1_flmB_dosta Yr2_flmB_dosta Yr3_flmB_dosta ...
    Yr1_sumobuoyR_dosta Yr1_sumobuoyT_dosta ...
    Yr2_sumobuoyR_dosta Yr2_sumobuoyT_dosta ...
    Yr3_sumobuoyT_dosta Yr4_sumobuoyT_dosta ...
    Yr1_sumo12mR_dosta

save OOI_SO_flortd_Yrs1-4 ...
    Yr1_sumo12m_flortd Yr1_sumobuoy_flortd Yr1_flmA_flortd Yr1_flmB_flortd ...
    Yr2_sumo12m_flortd Yr2_sumobuoy_flortd Yr2_flmA_flortd Yr2_flmB_flortd ...
    Yr3_sumo12m_flortd Yr4_sumobuoy_flortd
