function [output] = OOI_phsen_extract(filename)

output.info = ncinfo(filename);
    output.time = convertTime(ncread(filename,'time'));
    %output.lat = ncread(filename,'lat');
    %output.lon = ncread(filename,'lon');
    output.pH = ncread(filename,'phsen_abcdef_ph_seawater');
    output.T_thermister = ncread(filename,'phsen_thermistor_temperature');
    output.S = ncread(filename,'practical_salinity');
    
end