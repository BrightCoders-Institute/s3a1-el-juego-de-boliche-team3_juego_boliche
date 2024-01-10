# frozen_string_literal: false

require_relative './methods/rules'
# require_relative './methods/frame'

# Boliche class
class Boliche < Rules
  # def initialize
  #   super
  #   @frames = Array.new(10) { [0, [0, 0, 0]] }
  # end

  def randoms_shots(frame)
    first_shot = rand(0..10)
    second_shot = rand(0..10 - first_shot)
    third_shot = rand(0..10 - second_shot)

    frame.points = frame.last ? first_shot + second_shot + third_shot : first_shot + second_shot
    frame.first_shot = first_shot
    frame.second_shot = second_shot
    frame.third_shot = third_shot if frame.last
  end

  def fill_turns
    @line.each do |frame|
      randoms_shots(frame)
    end
    @line
  end

  # def display_turns
  #   @line.each do |frame|
  #     print frame
  #     # sleep(1)
  #   end
  #   puts ''
  # end

  def displadd
    print line.length
  end
end

g = Boliche.new
# g.displadd
g.fill_turns
g.strike
g.spare
g.display_board
# g.display_board
print "#{g.line_total}\n"
