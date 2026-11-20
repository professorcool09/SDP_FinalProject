clc
clear
close all

blank_sprite   = 1;      % transparent / empty
wall_sprite = 555;
dollar_sprite = 28 * 32 + 20;
colon_sprite = 29 * 32 + 30;
sprite0 = 29 * 32 + 20;
empty_bar = 26 * 32 + 24;
full_bar = 27 * 32 + 24;
letterA = 30 * 32 + 20;
letterN = 31 * 32 + 20;
yesoption = 25 * 32 + 24;
nooption = 25 * 32 + 25;
game_scene = simpleGameEngine('retro_pack.png',16,16,5,[197, 141, 75]);

background = ones(20, 30) * blank_sprite;
foreground = blank_sprite * ones(size(background));

%initial background:
background(2,2:(size(background, 2) - 1)) = wall_sprite;
background(2:(size(background, 1) - 1),2) = wall_sprite;
background(size(background,1)-1, 2:(size(background, 2) - 1)) = wall_sprite;
background(2:(size(background, 1) - 1), size(background,2)-1) = wall_sprite;

%Dollar Progress in bottom corner
background(size(background,1) - 3, 3) = dollar_sprite;
background(size(background,1) - 3, 4) = colon_sprite;
background(size(background,1) - 3, 5) = sprite0 + 5;
background(size(background,1) - 3, 6) = sprite0 + 0;
background(size(background,1) - 3, 7) = sprite0 + 0;
startingmoney = 500;

%Progress Bar
progressidx = 3;
background(size(background,1) - 2, progressidx:(size(background, 2) - 2)) = empty_bar;

%Start Button
foreground(floor(size(foreground,1) * 5 / 8), floor(size(foreground,2) / 2) - 2) = letterN + 5;
foreground(floor(size(foreground,1) * 5 / 8), floor(size(foreground,2) / 2) - 1) = letterN + 6;
foreground(floor(size(foreground,1) * 5 / 8), floor(size(foreground,2) / 2) - 0) = letterA + 0;
foreground(floor(size(foreground,1) * 5 / 8), floor(size(foreground,2) / 2) + 1) = letterN + 4;
foreground(floor(size(foreground,1) * 5 / 8), floor(size(foreground,2) / 2) + 2) = letterN + 6;

drawScene(game_scene,background,foreground)

% Wait until start button is pressed to begin the game
[row_clicked,col_clicked] = getMouseInput(game_scene);
while(foreground(row_clicked, col_clicked) == 1)
    [row_clicked,col_clicked] = getMouseInput(game_scene);
end

% First prompt of either spending money or progressing the goal
foreground = blank_sprite * ones(size(background));
foreground(floor(size(foreground,1) * 5 / 8), floor(size(foreground,2) / 2) - 5) = yesoption;
foreground(floor(size(foreground,1) * 5 / 8), floor(size(foreground,2) / 2) + 5) = nooption;
background(floor(size(background,1) * 3 / 8), floor(size(background,2) / 2) + 0) = dollar_sprite;

drawScene(game_scene, background, foreground)

[row_clicked,col_clicked] = getMouseInput(game_scene);
while(foreground(row_clicked, col_clicked) == 1)
    [row_clicked,col_clicked] = getMouseInput(game_scene);
end

if foreground(row_clicked, col_clicked) == yesoption
    startingmoney = startingmoney - 100;
    background(size(background,1) - 3, 5) = sprite0 + 4;
elseif foreground(row_clicked, col_clicked) == nooption
    background(size(background,1) - 2, progressidx) = full_bar;
    progressidx = progressidx + 1;
end

drawScene(game_scene,background,foreground)

