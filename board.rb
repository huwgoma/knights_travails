# frozen_string_literal: true
require 'pry'

class GameBoard
  def initialize
    8.times do |i|
      8.times do |j|
        binding.pry
        Cell.new(i, j)
      end
    end
  end
end

class Cell
  def initialize(x, y)
    @x = x
    @y = y
  end
end

