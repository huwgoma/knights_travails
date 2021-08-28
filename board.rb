# frozen_string_literal: true
require 'pry'

class GameBoard
  def initialize
    8.times do |i|
      8.times do |j|
        Cell.new(i, j)
      end
    end
  end
end

class Cell
  @@cells = []

  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
    @@cells << self 
  end

  def self.find_cell(x, y)
    @@cells.find { |coords| coords.x == x && coords.y == y }
  end

  
end

