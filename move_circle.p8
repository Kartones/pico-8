pico-8 cartridge // http://www.pico-8.com
version 8
__lua__

x = 64
y = 64
radius = 5
speed = 6
min_pos = 0 + radius
max_pos = 127 - radius

function _update()
 if (btn(0)) then
    if (x > radius) then x = max(x - speed, min_pos) end
 end
 if (btn(1)) then
    if (x < max_pos) then x = min(x + speed, max_pos) end
 end
 if (btn(2)) then
    if (y > radius) then y = max(y - speed, min_pos) end
 end
 if (btn(3)) then
    if (y < max_pos) then y = min(y + speed, max_pos) end
 end
end

function _draw()
 rectfill(0,0,127,127,1)
 circfill(x,y,radius,12)
end
