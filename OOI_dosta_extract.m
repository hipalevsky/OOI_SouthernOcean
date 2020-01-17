function [output] = OOI_dosta_extract(filename)

output.info = ncinfo(filename);
    output.time = convertTime(ncread(filename,'time'));
    %output.lat = ncread(filename,'lat');
    %output.lon = ncread(filename,'lon');
    output.O2satraw = ncread(filename,'estimated_oxygen_saturation');
    output.O2concraw = ncread(filename,'estimated_oxygen_concentration');
    output.O2 = ncread(filename,'dissolved_oxygen'); %corrected for S, T and depth
  %Omit these variables because not available for some sensors
    %output.T = ncread(filename,'ctdmo_seawater_temperature');
    %output.S = ncread(filename,'practical_salinity');
    %output.P = ncread(filename,'int_ctd_pressure');
end