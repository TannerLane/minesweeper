require_relative "tile"
require "byebug"

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(9) { Array.new(9) {Tile.new}}
    10.times do
      pos = [rand(0..8), rand(0..8)]
      while(self[pos].is_mine)
        pos = [rand(0..8), rand(0..8)]
      end
      self[pos].is_mine = true
    end
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
end
