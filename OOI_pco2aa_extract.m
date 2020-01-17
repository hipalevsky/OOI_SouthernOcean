function [output] = OOI_pco2aa_extract(filename)

output.info = ncinfo(filename);
    output.time = convertTime(ncread(filename,'time'));
    output.pCO2_atm = ncread(filename,'partial_pressure_co2_atm');
    try
        output.pCO2_ssw = ncread(filename,'partial_pressure_co2_ssw');
    catch
        output.pCO2_ssw = NaN;
    end
    output.SST = ncread(filename,'sea_surface_temperature');
    output.SSS = ncread(filename,'met_salsurf');
    output.wind10m = ncread(filename,'met_wind10m');
    
end