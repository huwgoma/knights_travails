# Game Board Class - Create an 8x8 grid of Cell objects 
class GameBoard
  def initialize(x = 8, y = 8)
    x.times do |i|
      y.times do |j|
        Cell.new(i, j)
      end
    end
  end
end

# Cell Class - Objects that each represent one square on the 8x8 Board
class Cell
  @@cells = []

  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
    @@cells << self 
  end

  def self.find(x, y)
    @@cells.find { |cell| cell.x == x && cell.y == y }
  end
end

