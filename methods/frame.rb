# frozen_string_literal: false

# turn class
class Frame
  attr_accessor :points, :first_shot, :second_shot, :third_shot, :bonus, :last

  def initialize(last: false)
    @last = last
    @points = 0
    @first_shot = 0
    @second_shot = 0
    @third_shot = 0
    @bonus = 0
  end
end
