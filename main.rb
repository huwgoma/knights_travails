# frozen_string_literal: true

require 'pry'
require_relative 'board'
require_relative 'knight'

board = GameBoard.new

def knight_moves(start, finish)
  p Cell.find_cell(start.first, start.last)
end

knight_moves([0, 0], [1, 2])