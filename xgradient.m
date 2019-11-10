function xgradient()
    im = im2double(imread('MidTerm.png'));
    k1 = [-1 -1 -1; 0 0 0; 1 1 1];
    im = padarray(im,[floor(size(k1, 1)/2) floor(size(k1, 2)/2)],0,'both');
    for i=ceil(size(k1, 1)/2): size(im, 1)-floor(size(k1,1)/2)
        for j=ceil(size(k1, 2)/2): size(im, 2)-floor(size(k1,2)/2)
            curseg = im(i-floor((size(k1, 1)/2)): i+floor((size(k1, 1)/2)), j-floor((size(k1, 2)/2)): j+floor((size(k1, 2)/2)));
            out(i-1, j-1) = sum(sum(curseg.*k1));
        end
    end
    out2 = (out.^2);
    imshowpair(conv2(out2, gaussian2d(1, 1.2)), out2, 'montage');
end
function f=gaussian2d(N,sigma)
 [X,Y]=meshgrid(round(-N/2):round(N/2), round(-N/2):round(N/2));
 f=exp(-X.^2/(2*sigma^2)-Y.^2/(2*sigma^2))/(2*pi*sigma*sigma);
 f=f./sum(f(:));
end