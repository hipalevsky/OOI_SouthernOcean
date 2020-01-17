function [dayind,nightind] = indexDayNight(lat,lon,UTCoffset,time_in,tol)
%%%% Function to separate day and night timestamps based on local sunrise
%%%% and sunset times (using SunriseSunset function)

%%%% INPUTS %%%%%%
% lat = local latitude
% lon = local longitude
% UTCoffset = time zone
% time_in = timestamp in matlab date/time format (from which to find day
    % and night indices)
% tol = number of hours before/after sunrise/sunset to count as daytime

%%%% OUTPUTS %%%%%%
% dayind = indices of time_in that are during daylight
% nightind = indices of time_in that are during the night

%% Calculate local sunrise and sunset times
[sunrise,sunset] = SunriseSunset(lat,lon,UTCoffset); %time in hours

%% Parse time_in
year = str2num(datestr(time_in,10)); %year of sampling
julianday = time_in - datenum(year,0,0); %Julian day w/o year to create annual composite
time = julianday - floor(julianday);

%% Add additional day to sunrise and sunset if a leap year
if floor(max(julianday)) == 366
    %Just duplicate julianday 365 values for julianday 366
    sunrise(366) = sunrise(365);
    sunset(366) = sunset(365);
end

%% Loop over all points in time_in to separate day and night
daytimeind = zeros(length(time_in),1);
for i = 1:length(time_in)
    if time(i) > (sunrise(floor(julianday(i))) - tol)/24 & time(i) < (sunset(floor(julianday(i))) + tol)/24
        daytimeind(i) = 1;
    end
end

%% Save day and night indices for output
dayind = find(daytimeind == 1);
nightind = find(daytimeind == 0);

end