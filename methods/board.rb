# frozen_string_literal: false

require_relative 'frame'
# turn class
class Board
  attr_accessor :line

  def initialize
    @line = Array.new(10) { Frame.new }
    @line[9].last = true
    @line_total = 0
  end

  def display_board
    @line.each do |frame|
      print [frame.points, frame.first_shot, frame.second_shot] unless frame.last
      print [frame.points, frame.first_shot, frame.second_shot, frame.third_shot] if frame.last
    end
    puts ''
  end

  def line_total
    x = 0
    @line.each do |frame|
      x += frame.points
    end
    x
  end
end

# b = Board.new()

# b.display_board
