# frozen_string_literal: true

require 'pry'
require_relative 'board'
require_relative 'knight'
require_relative 'graph'
require_relative 'dijkstra'

board = GameBoard.new
knight = Knight.new

knight.knight_moves([1, 0], [3,3])
