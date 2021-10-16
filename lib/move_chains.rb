# frozen_string_literal: true

require_relative 'knight'

# Chains of possible moves for several turns
class MoveChains
  attr_reader :start

  def initialize(position)
    @start = position
  end

  def add_second_layer
    second_layer = []
    start.possible_moves.each do |possible_position|
      second_layer << Knight.new(possible_position[0], possible_position[1])
    end
    second_layer
  end

  def add_third_layer(second_layer)
    third_layer = []
    second_layer.each do ||
      third_layer << Knight.new(possible_position)
    end
    third_layer
  end
end

knight = Knight.new(2, 1)
position = MoveChains.new(knight)
p position.add_second_layer
# p position.add_third_layer
