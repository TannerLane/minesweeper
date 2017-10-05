class Tile
  attr_accessor :num_neighbor_mines, :is_flipped, :is_mine

  def initialize
    @is_mine = false
    @is_flipped = false
    @num_neighbor_mines = 0
  end

  def to_s
    return "X" if is_mine
    return num_neighbor_mines.to_s
  end
end
