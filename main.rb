# frozen_string_literal: false

require_relative 'methods/game'

g = Boliche.new
# g.displadd
g.fill_turns
g.check
g.display_board
# g.display_board
print "#{g.line_total}\n"
