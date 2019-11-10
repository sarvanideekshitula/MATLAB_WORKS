function CompareHistogram()
im1 = imread('pic1.jpg');
hist1 = imhist(im1); 
hist1 = hist1/sum(hist1);
im2 = imread('pic2.png');
hist2 = imhist(im2); 
hist2 = hist2/sum(hist2);
measure = compareHistograms(hist1, hist2);
plot (0:255, hist1); hold on;
plot (0:255, hist2); title (['Hist1 Vs Hist2' num2str(measure)]);
plot (0:255, imHistg); xlabel('intensity'); 
ylabel('count of picxels'); 
title ('histogram');
end
function measure = compareHistograms(h1, h2)
measure = sqrt(mean((h1-h2).^2));
end