pico-8 cartridge // http://www.pico-8.com
version 8
__lua__

function initialize_board()
 for y=1, height do
  boards[1][y] = {}
  boards[2][y] = {}
  for x=1, width do
   boards[1][y][x] = 0
   boards[2][y][x] = 0
  end
 end

 -- draw a blinker
 boards[board_index][60][34] = 1
 boards[board_index][61][34] = 1
 boards[board_index][62][34] = 1

 --draw an r pentomino
 boards[board_index][60][64] = 1
 boards[board_index][60][65] = 1
 boards[board_index][61][63] = 1
 boards[board_index][61][64] = 1
 boards[board_index][62][64] = 1
end

function get_cell(index, x, y)
 if ((x < 1) or (x > width) or (y < 1) or (y > height)) then
  return 0
 else
  return boards[index][y][x]
 end
end

function _init()
 alive_color = 11
 width = 128
 height = 128

 board_index = 1
 boards = {{}, {}}

 initialize_board()
 cls()
end

function update_board()
 new_index = (board_index % 2) + 1
 for y=1, height do
  for x=1, width do
   neighbors = (
    get_cell(board_index, x-1, y-1) +
    get_cell(board_index, x, y-1) +
    get_cell(board_index, x+1, y-1) +
    get_cell(board_index, x-1, y) +
    get_cell(board_index, x+1, y) +
    get_cell(board_index, x-1, y+1) +
    get_cell(board_index, x, y+1) +
    get_cell(board_index, x+1, y+1)
   )
   if ((neighbors == 3) or ((boards[board_index][y][x] == 1) and neighbors == 2)) then
    boards[new_index][y][x] = 1
   else
    boards[new_index][y][x] = 0
   end
  end
 end
 board_index = new_index
end

function _draw()
 for y=1, height do
  for x=1, width do
   pset(x-1, y-1, boards[board_index][y][x] * alive_color)
  end
 end
 update_board()
end
