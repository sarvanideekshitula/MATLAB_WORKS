function f=gaussian2d(N,sigma)
 [X,Y]=meshgrid(round(-N/2):round(N/2), round(-N/2):round(N/2));
 f=exp(-X.^2/(2*sigma^2)-Y.^2/(2*sigma^2))/(2*pi*sigma*sigma);
 f=f./sum(f(:));
end

