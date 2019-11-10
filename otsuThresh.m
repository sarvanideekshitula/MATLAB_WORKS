I = imread('son1.png');
level = graythresh(I);
level
BW = imbinarize(I, level);
imshowpair(I,BW,'montage')