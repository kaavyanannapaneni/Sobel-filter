%Application of Sobel filter to a given image
inputImage = imread('image/building.jpg'); 

%Original Image
figure; 

imshow(inputImage); 
title('Original Image');

% converting color image to gray 
A = rgb2gray(inputImage); 
figure;
imshow(A);
title('gray image');

B = double(A); 

%Applying Sobel mask for x and y direction
for i=1: size(B,1)-2 
    for j=1: size(B,2)-2 
        Gx = ((2*B(i+2,j+1)+B(i+2,j)+B(i+2,j+2))-(2*B(i,j+1)+B(i,j)+B(i,j+2))); 
        Gy = ((2*B(i+1,j+2)+B(i,j+2)+B(i+2,j+2))-(2*B(i+1,j)+B(i,j)+B(i+2,j))); 
        A(i,j) = sqrt(Gx.^2+Gy.^2); 
    end 
end 

figure; 
imshow(A); 
title('Sobel Gradient'); 

%Threshold value 
Thresh = 100; 
A=max(A,Thresh); 
A(A==round(Thresh))=0; 
A=uint8(A); 

figure; 
imshow(~A); 
title('Edge detected Image'); 