clc;
clear all;
close all;

%% main
chessb = imread('chessBoard.png');

fig_h = figure(1);
imshow(chessb);

%add callback to figure
set(fig_h,'WindowButtonDownFcn', @fig_callback );
