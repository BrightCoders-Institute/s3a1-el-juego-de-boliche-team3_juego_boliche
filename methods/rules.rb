# frozen_string_literal: false

require_relative 'board'
# class
class Rules < Board
  def calculate_strike_points(frame, next_frame, second_next_frame)
    frame.points += if next_frame.last
                      next_frame.first_shot + next_frame.second_shot
                    elsif next_frame.first_shot != 10
                      next_frame.first_shot + next_frame.second_shot
                    else
                      next_frame.first_shot + second_next_frame.first_shot
                    end
  end

  def strike(frame, idx)
    next_frame = @line[idx + 1]
    if idx < @line.length - 1
      calculate_strike_points(frame, next_frame, @line[idx + 2])
    elsif frame.last
      frame.points = frame.first_shot + frame.second_shot + frame.third_shot
    end
  end

  def spare(frame, idx)
    condition = (frame.first_shot + frame.second_shot) == 10 if frame.first_shot < 10

    frame.points += @line[idx + 1].first_shot if condition && !frame.last
  end

  def check
    @line.each_with_index do |frame, idx|
      spare(frame, idx)
      strike(frame, idx) if frame.first_shot == 10
    end
  end
end
