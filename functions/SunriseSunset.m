function [sunrise,sunset] = SunriseSunset(lat,long,UTCoff)
%Converted to a function by H. Palevsky (4/6/2017)
%Downloaded from https://www.mathworks.com/matlabcentral/fileexchange/55509-sunrise-sunset

%% Estimating Sunrise and Sunset
% We can estimate the time of sunrise and sunset for any location on the earth 
% if we know the latitude, longitude, and UTC offset for that location.  To estimate 
% sunrise and sunset for any day of the year we need to calculate two values -- 
% the solar time correction and the solar declination.
%
% 
%% Solar Time Correction
% To calculate the sun's position for a given place and day we need to calculate 
% the _solar time correction_. Solar time is based on the sun's position in the 
% sky.  For example, solar noon is defined to be the time when the sun is highest 
% in the sky. The solar time correction is the difference (in minutes) between 
% solar time and local time. The correction has two parts:
% 
% * A constant value that accounts for local longitudinal position
% * A daily value that accounts for the eccentricity of the earth's orbit calculated 
% from the <https://en.wikipedia.org/wiki/Equation_of_time Equation of Time> (EoT).
% 
% For this example, we will use Boston as our location.  We can see how the 
% solar time correction changes over the course of a year.

% long = -71.06;                                          % longitude
% lat  = 42.36;                                           % latitude
% UTCoff = -5;                                            % UTC offset

longCorr = 4*(long - 15*UTCoff);                         % longitudinal correction
days = 1:365;
B = 360*(days - 81)/365;
EoTCorr = 9.87*sind(2*B) - 7.53*cosd(B) - 1.5*sind(B);  % Equation of Time correction
solarCorr = longCorr + EoTCorr;

% clf
% plot(days,solarCorr)
% axis([1 365 0 35])
% % title('Solar Time Correction')
% xlabel('Day of Year')
% ylabel('Minutes')
%% Solar Declination
% The other value we need is the <https://en.wikipedia.org/wiki/Declination 
% solar declination>.  Solar declination ($\delta$) is the angle of the sun relative 
% to the earth's equatorial plane. 
% 
% 
% 
% The solar declination is $0^\circ$ at the vernal and autumnal equinoxes 
% and in the northern hemisphere rises to a maximum of$23.45^\circ$ at the summer 
% solstice. On any given day of the year (_d_), solar declination ($\delta$) can 
% be calculated from the following formula:
% 
% $$\delta = \sin^{-1}\left[\sin(23.45)\sin\left(\frac{360}{365}(d - 81)\right)\right]$$
% 
% Live Editor ?????????????????????????? 

delta = asind(sind(23.45)*sind(360*(days - 81)/365));    % Solar declination

clf
plot(days,delta)
axis([1 365 -30 30])
title('Solar Declination')
xlabel('Day of Year')
ylabel('Degrees')
%% Estimating Sunrise and Sunset
% Knowing the local latitude ($\phi$), the sun's declination ($\delta$) and 
% the solar time correction ($SC$) allows us to calculate the time of sunrise 
% and sunset. Sunrise and sunset are calculated in Standard Time.
% 
% $$\mbox{sunrise} = 12 - \frac{\cos^{-1}\left(-\tan\phi\tan\delta\right)}{15^\circ} 
% - \frac{SC}{60}$$
% 
% $$\mbox{sunset} = 12 + \frac{\cos^{-1}\left(-\tan\phi\tan\delta\right)}{15^\circ} 
% - \frac{SC}{60}$$

sunrise = 12 - acosd(-tand(lat)*tand(delta))/15 - solarCorr/60;
sunset  = 12 + acosd(-tand(lat)*tand(delta))/15 - solarCorr/60;

clf
plot(days, sunrise, days, sunset, 'LineWidth', 4)
axis([1 365 0 24])
title('Sunrise and Sunset')
xlabel('Day of Year')
ylabel('Time of Day')
legend('Sunrise', 'Sunset')
hold on
patch([days flip(days)], [sunrise flip(sunset)], [0.97 0.69 0.34])

% %% Which Days Have the Earliest and Latest Sunset?
% % Calculate the day of the year with the earliest sunset
% 
% [~, idx] = min(sunset);
% earliest = datetime(2016, 1, 1, 'Format', 'MMMM dd, yyyy') + days(idx-1)
% %% 
% % Calculate the day of the year with the latest sunset
% 
% [~, idx] = max(sunset);
% latest   = datetime(2016, 1, 1, 'Format', 'MMMM dd, yyyy') + days(idx-1)
% %% 
% %  Copyright 2016 The MathWorks, Inc.

end