function gradient2()
    im = im2double(rgb2gray(imread('MidTerm.png')));
    [m, n] = size(im);
    [Gx,Gy] = imgradientxy(im);
    I1 = Gx.^2;
    I2 = Gy.^2;
    I3 = Gx.*Gy;
    VIm = zeros(m, n);
    for i=1:m
        for j=1:n
            x = I1(i, j);
            y = I2(i, j);
            z = I3(i, j);
            M = [x z; z y];
            V = det(M) - 0.04*trace(M)^2;
            VIm(i, j) = V;
        end
    end
    imshow(VIm, []);
end
