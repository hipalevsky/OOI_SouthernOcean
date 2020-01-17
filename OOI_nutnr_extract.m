function [output] = OOI_nutnr_extract(filename)

output.info = ncinfo(filename);
    output.time = convertTime(ncread(filename,'time'));
    %output.lat = ncread(filename,'lat');
    %output.lon = ncread(filename,'lon');
    output.NO3 = ncread(filename,'salinity_corrected_nitrate');
end