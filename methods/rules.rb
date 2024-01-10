# frozen_string_literal: false

require_relative 'board'

# rules class
class Rules < Board
  def strike
    @line.each.with_index do |frame, idx|
      condition = frame.first_shot == 10

      if condition && idx < @line.length - 2
        frame.points += @line[idx + 1].first_shot + @line[idx + 1].second_shot if @line[idx + 1].first_shot != 10
        frame.points += @line[idx + 1].first_shot + @line[idx + 2].first_shot if @line[idx + 1].first_shot == 10
      end

      frame.points += @line[idx + 1].first_shot + @line[idx + 1].second_shot if condition && idx == 8

      frame.points = frame.first_shot + frame.second_shot + frame.third_shot if frame.last && condition
    end
    @line
  end

  def spare
    display_board
    @line.each.with_index do |frame, idx|
      condition = (frame.first_shot + frame.second_shot) == 10 if frame.first_shot < 10

      frame.points += @line[idx + 1].first_shot if condition && !frame.last
    end
  end
end
