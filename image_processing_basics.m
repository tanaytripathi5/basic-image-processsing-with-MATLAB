%% Report Day 1 - Image Proceesing with MATLAB
% Tanay Tripathi
% 31 Oct 2020
%% Working with differnt types of images
% Reading images fro directories
f = imread('D:\Pictures\download.jfif');
% checking size of image
[M,N] = size(f);
% Displaying image
imshow(f);
%inspecting image in more detail on pixel level
%imtool(f);
% Converting color image to gray scale on matrix level [0,1]
% Dispalying graysclae image
h = rgb2gray(f);
figure
imshow(h)
% Converting grayscale images to b&w on matrix level 0 or 1 based on threshhold
% value
i = im2bw(g,0.5)
figure 
imshow(i)

%% Spatial filtering
%Spatial Filtering technique is used directly on pixels of an image. Mask is usually 
%considered to be added in size so that it has specific center pixel. 
%This mask is moved on the image such that the center of the mask traverses all image pixels.
% MATLAB has two spatial filtering Convolution and Correlation
%Correlation is measurement of the similarity between two signals/sequences.
%Convolution is measurement of effect of one signal on the other signal.
%The mathematical calculation of Correlation is same as convolution in time domain, except that 
%the signal is not reversed, before the multiplication process. If the filter is symmetric then the 
%output of both the expression would be same.
% Original image
figure
imshow(h);
% Linear Spatial filtering
% Laplacian filter
wl = fspecial('laplacian',0)
% Type of image is unit8 applying the filter gives a better understanding
% of features
gl = imfilter(h,wl,'replicate');
figure
imshow(gl,[])
% Converting image to float to get a different approach
h1 = im2double(h);
g2 = imfilter(h1,wl,'replicate');
figure
imshow(g2,[])
% To get a sharper image
s = h1-g2;
figure
imshow(s)
% Special filter for enhancing images 
% Original filter w1 had -4 in center replacing it by -8 
ws= [1 1 1 ; 1 -8 1 ; 1 1 1];
g4 = h1 - imfilter(h1,wl,'replicate');
g8 = h1 - imfilter(h1,ws,'replicate');
%Original image
figure
imshow(h1)
% Semi enhanced image
figure
imshow(g4)
% Further enchnaced using special filter
figure
imshow(g8)

%% Fourier Transforms on images
% Fourier Transform on image 
F = fft2(h);
S = abs(F);
figure
imshow(S,[])
% shiting the origin (Centered Transform)
Fc = fftshift(F);
figure
imshow(abs(Fc),[])
% 
figure
S2 = log(1+abs(Fc));
imshow(S2,[])
%% Image segmentation
% Point detection
f = imread('D:\Pictures\pic1.jpg');
figure
imshow(f)
h = rgb2gray(f);
figure
imshow(h)
ws= [1 1 1 ; 1 -8 1 ; 1 1 1];
gp = abs(imfilter(im2double(h),ws));
T = max(gp(:));
g = gp >=T;
figure
imshow(g)
% Line Detection
wl = [2 -1 -1 ; -1 2 -1 ; -1 -1 2];
g2 = imfilter(h,wl);
figure
imshow(g2,[])
%Edge Detection - vertical
[gv,t] = edge(h,'sobel','vertical');
figure
imshow(gv)
t
% Edge detection - 45
w45 = [-2 -1 0 ; -1 0 1 ; 0 1 2];
g45 = imfilter(im2double(h),w45,'replicate');
T = 0.3*max(abs(g45(:)));
g45 = g45>=T;
figure,imshow(g45);

