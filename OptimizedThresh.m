function OptimizedThresh()
    im = im2double(rgb2gray(imread('son1.png')));
    [m, n] = size(im);
    num = 18;
    rstep = round(m/num);
    cstep = round(n/num);
    endr = 0;
    setimg = zeros(m, n);
    for i=1:num
        startr = endr+1;
        if i < num
            endr = endr+rstep;
        else
            endr = m;
        end
        endc = 0;
        for j=1:num
            startc = endc+1;
            if j < num
                endc = endc + cstep;
            else
                endc = n;
            end
            ims = im(startr:endr, startc:endc);
            graythresh(ims);
            if(var(ims(:)) > (var(im(:))*0.00625))
                setimg(startr : endr, startc : endc) =  (ims > graythresh(ims));
            else
                setimg(startr : endr, startc : endc) = ims;
            end
        end
    end
    imshow(setimg, []);

    