clc
clear
close all

blank_sprite = 1;
wall_sprite = 17;
bed_sprite = 9*32 + 6;
chair_sprite = 9*32 + 2;
table_sprite = 9*32 + 3;
toilet_sprite = 11*32 +12;
sink_sprite = 10*32 +13;
stove_sprite = 9*32 + 12;

game_scene= simpleGameEngine("retro_pack.png" , 16,16,5,[1,1,1]);