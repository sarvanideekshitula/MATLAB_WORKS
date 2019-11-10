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
            ims = im(startr : endr, startc : endc);
            maxi = max(ims(:));
            for k = startr:endr
                for l=startc:endc
                    if im(k, l)==maxi
                        if maxi > 0.25
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
    imshowpair(im,setim,'montage')
    
    
    
    k1 = [-1 -1 -1; 0 0 0; 1 1 1];
    im = padarray(im,[floor(size(k1, 1)/2) floor(size(k1, 2)/2)],0,'both');
    for i=ceil(size(k1, 1)/2): size(im, 1)-floor(size(k1,1)/2)
        for j=ceil(size(k1, 2)/2): size(im, 2)-floor(size(k1,2)/2)
            curseg = im(i-floor((size(k1, 1)/2)): i+floor((size(k1, 1)/2)), j-floor((size(k1, 2)/2)): j+floor((size(k1, 2)/2)));
            out(i-1, j-1) = sum(sum(curseg.*k1));
        end
    end
    k2 = [-1 0 1; -1 0 1; -1 0 1];
    im = padarray(im,[floor(size(k2, 1)/2) floor(size(k2, 2)/2)],0,'both');
    for i=ceil(size(k2, 1)/2): size(im, 1)-floor(size(k2,1)/2)
        for j=ceil(size(k2, 2)/2): size(im, 2)-floor(size(k2,2)/2)
            curseg = im(i-floor((size(k2, 1)/2)): i+floor((size(k2, 1)/2)), j-floor((size(k2, 2)/2)): j+floor((size(k2, 2)/2)));
            out2(i-1, j-1) = sum(sum(curseg.*k2));
        end
    end
    
    %out4 = (out.^2);
    %out5 = (out2.^2);
    out3 = (out.*out2);
    imshow(out3);
    %M = [out4 out3; out3 out5];
    %det(M)
    %V = det(M) - 0.04*trace(M)^2;
    %imshow(V);
    %imshowpair(conv2(out3, gaussian2d(1, 1.2)), out3, 'montage');