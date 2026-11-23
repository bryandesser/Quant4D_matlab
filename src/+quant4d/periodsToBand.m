function band = periodsToBand(periods)
%PERIODSTOBAND iCoM/dCoM band-pass from feature sizes in scan pixels.
%
% Keeps features whose repeat length is between minPx and maxPx scan pixels: maxPx
% sets the low-frequency cut (slow background, drift) and minPx the high-frequency
% cut (noise). minPx <= 1 and maxPx >= the larger scan size (or Inf) mean no
% filtering. The order of the two values does not matter.
%
% Usage::
%
%     band = quant4d.periodsToBand([minPx maxPx])
%
% Parameters:
%     periods ([double double]) : smallest and largest feature size in scan pixels
%
% Returns:
%     band ([double double]) : [1/maxPx 1/minPx] in cycles per pixel, for
%         quant4d.integrateCoM
arguments
    periods (1,2) double {mustBePositive}
end
periods = sort(periods);
band = 1./fliplr(periods);       % [1/maxPx 1/minPx]; 1/Inf = 0
end
