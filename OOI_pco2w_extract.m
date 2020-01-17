function [output] = OOI_pco2w_extract(filename)

output.info = ncinfo(filename);
    output.time = convertTime(ncread(filename,'time'));
    %output.lat = ncread(filename,'lat');
    %output.lon = ncread(filename,'lon');
    output.pCO2 = ncread(filename,'pco2_seawater');
    output.T_thermister = ncread(filename,'pco2w_thermistor_temperature');
    output.absorbance_ratio_434 = ncread(filename,'absorbance_ratio_434');
    output.absorbance_ratio_620 = ncread(filename,'absorbance_ratio_620');
    output.absorbance_blank_434 = ncread(filename,'absorbance_blank_434');
    output.absorbance_blank_620 = ncread(filename,'absorbance_blank_620');
end