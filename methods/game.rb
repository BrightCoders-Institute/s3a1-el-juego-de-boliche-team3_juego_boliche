# frozen_string_literal: false

require_relative 'rules'
# require_relative './methods/frame'

# Boliche class
class Boliche < Rules
  def randoms_shots(frame)
    first_shot = rand(0..10)
    second_shot = rand(0..10 - first_shot)

    frame.points = first_shot + second_shot
    frame.first_shot = first_shot
    frame.second_shot = second_shot
    return unless frame.last
    return unless frame.points == 10

    frame.points += frame.third_shot = rand(0..10 - second_shot)
  end

  def fill_turns
    @line.each do |frame|
      randoms_shots(frame)
    end
    @line
  end
end
