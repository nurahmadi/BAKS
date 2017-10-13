% Bayesian Adaptive Kernel Smoother (BAKS)
% BAKS is a method for estimating firing rate from spike train data that uses kernel smoothing technique 
% with adaptive bandwidth determined using a Bayesian approach
% ---------------INPUT---------------
% - SpikeTimes : spike event times [nSpikes x 1]
% - Time : time at which the firing rate is estimated [nTime x 1]
% - a : shape parameter (alpha) 
% - b : scale paramter (beta)
% ---------------INPUT---------------
% - h : adaptive bandwidth [nTime x 1]
% - FiringRate : estimated firing rate [nTime x 1]
% More information, please refer to "Estimation of neuronal firing rate using Bayesian adaptive kernel smoother (BAKS)"

function [FiringRate h] = BAKS(SpikeTimes,Time,a,b)
N = length(SpikeTimes);
sumnum = 0; sumdenum = 0;
for i=1:N
    numerator = (((Time-SpikeTimes(i)).^2)./2 + 1./b).^(-a);
    denumerator = (((Time-SpikeTimes(i)).^2)./2 + 1./b).^(-a-0.5);
    sumnum = sumnum + numerator;
    sumdenum = sumdenum + denumerator;
end
h = (gamma(a)/gamma(a+0.5)).*(sumnum./sumdenum);

FiringRate = zeros(length(Time),1);
for j=1:N
    K = (1./(sqrt(2.*pi).*h)).*exp(-((Time-SpikeTimes(j)).^2)./(2.*h.^2));
    FiringRate = FiringRate + K;
end