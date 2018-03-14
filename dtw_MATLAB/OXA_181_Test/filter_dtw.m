load bostemp
days = 1:length(k);
h = [1/2 1/2];
binomialCoeff = conv(h,h);
for n = 1:1
    binomialCoeff = conv(binomialCoeff,h);
end

figure
fDelay = (length(binomialCoeff)-1)/2;
x = days - fDelay;
binomialMA = filter(binomialCoeff, 1, k);
plot(days,k, ...
     x(3:end),binomialMA(3:end))
axis tight
legend('Hourly Temp','Binomial Weighted Average','location','best')
ylabel('Temp (\circC)')
xlabel('Time elapsed from Jan 1, 2011 (days)')
title('Logan Airport Dry Bulb Temperature (source: NOAA)')