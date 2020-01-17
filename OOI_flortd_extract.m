function [output] = OOI_flortd_extract(filename)

output.info = ncinfo(filename);
    output.time = convertTime(ncread(filename,'time'));
    output.backscat = ncread(filename,'optical_backscatter');
    output.chl = ncread(filename,'fluorometric_chlorophyll_a');
   
end