clc
clear
close all

blank_sprite = 1;
wall_sprite = 17;
bed_sprite = 8*32 + 6;
chair_sprite = 8*32 + 2;
table_sprite =8*32 + 3;
toilet_sprite = 10*32 +13;
sink_sprite = 9*32 +14;
stove_sprite = 8*32 + 12;
blue_square = 5*32 + 9;
game_scene= simpleGameEngine('retro_pack.png' , 16,16,5,[150,150,150]);

background = ones(12,15) * blank_sprite;
foreground = ones(size(background))* blank_sprite;
%initial background
background(2,2:(size(background, 2) - 1)) = wall_sprite;
background(2:(size(background, 1) - 1),2) = wall_sprite;
background(size(background,1)-1, 2:(size(background, 2) - 1)) = wall_sprite;
background(2:(size(background, 1) - 1), size(background,2)-1) = wall_sprite;

%chair 
background(3, 3) = chair_sprite;
background(3, 5) = chair_sprite;
%table
background(3,4) = table_sprite;
%bed
background(10, 3) = bed_sprite;
%bathroom
background(3, 9) = toilet_sprite;
background(3,10) = sink_sprite;
%stove
background(5,3) = stove_sprite;
%question 1
background(6:7, 5:7) = blue_square;
background(6:7, 9:11) = blue_square;
drawScene(game_scene, background, foreground)