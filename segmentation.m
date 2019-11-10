function segmentation()
    im = im2double(rgb2gray(imread('MidTerm.png')));
    [r, c] = size(im);
    [Gx,Gy] = imgradientxy(im);
    I1 = Gx.^2;
    I2 = Gy.^2;
    I3 = Gx.*Gy;
    VIm = zeros(r, c);
    for i=1:r
        for j=1:c
            x = I1(i, j);
            y = I2(i, j);
            z = I3(i, j);
            M = [x z; z y];
            V = det(M) - 0.04*trace(M)^2;
            VIm(i, j) = V;
        end
    end
    %imshow(VIm, []);
    [m, n] = size(VIm);
    num = 5;
    setim = zeros(m, n);
    rstep = round(m/num);
    cstep = round(n/num);
    endr = 0;
    for i= 1:num
        startr = endr+1;
        if i < num
            endr = endr + rstep;
        else
            endr = m;
        end
        endc = 0;
        for j=1:num
            startc = endc +1;
            if i < num
                endc = endc +cstep;
            else
                endc = n;
            end
            ims = VIm(startr:endr, startc : endc);
            maxi = max(ims(:));
            for k = startr:endr
                for l=startc:endc
                    if VIm(k, l)==maxi
                        if VIm(k, l) > 0.25
                            setim(k, l) = 1;
                        else
                            setim(k, l) = 0;
                        end
                    else 
                        setim(k, l) = 0;
                    end
                end
            end
        end
    end
    imshow(setim, []);
end
