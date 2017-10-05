require_relative "tile"
require "byebug"

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(9) { Array.new(9) {Tile.new}}
    20.times do
      pos = [rand(0..8), rand(0..8)]
      while(self[pos].is_mine)
        pos = [rand(0..8), rand(0..8)]
      end
      self[pos].is_mine = true
    end
    init_mine_neighbors
  end

  def [](pos)
    x , y = pos
    @grid[x][y]
  end

  def []=(pos, val)
    x, y = pos
    @grid[x][y] = val
  end

  def render
    @grid.each do |row|
      row.each do |el|
        print el.to_s
      end
      puts
    end
  end

  def init_mine_neighbors
    @grid.each_with_index do |tiles, row|
      tiles.each_index do |col|
        tile = self[[row, col]]
        next if tile.is_mine
        num = 0
        neighbors = neighbors([row, col])
        neighbors.each do |neighbor|
          num += 1 if self[neighbor].is_mine
        end
        tile.num_neighbor_mines = num
      end
    end
  end

  def neighbors(pos)
    neighbors = []
    deltas = [[-1,0], [1,0], [0,1], [0, -1], [1, 1], [1, -1], [-1, 1], [-1, -1]]
    deltas.each do |delta|
      new_pos = [pos[0] + delta[0], pos[1] + delta[1]]
      neighbors << new_pos if new_pos.all? { |el| el.between?(0, @grid.length-1) }
    end
    neighbors
  end
end
