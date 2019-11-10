function globalthresh()
    im =imread('son1.png');
    img = im2double(rgb2gray(im));
    [r,c]=size(img);
    num=18;
    rstep = round(r/num);
    cstep =round(c/num);
    endr = 0;
    setimg = zeros(r,c);

    for i =1:num
       startr = endr+1;
       if i < num-1
            endr = endr+rstep;
       else
           endr = r;
       end
       endc = 0;
       for h=1:num
           startc = endc+1;
           if h < num-1
               endc = endc +cstep;
           else
               endc = c;
           end
           ims = img(startr : endr, startc : endc);
           graythresh(ims);
           if var(ims(:)) > var(img(:))*0.00625
               % setimg(startr : endr, startc : endc) = imbinarize(ims,graythresh(ims));
               setimg(startr : endr, startc : endc) =  (ims > graythresh(ims));
           else
               setimg(startr : endr, startc : endc) = ims;
           end
       end
    end
    figure
    imshow(setimg, []);
end