# frozen_string_literal: true

# Knight position and possible turns
class Knight
  attr_reader :horizontal, :vertical, :possible_moves

  POSSIBLE_MOVES = [[2, 1], [1, 2], [-1, 2], [-2, 1], [-2, -1], [-1, -2], [1, -2], [2, -1]].freeze

  def initialize(horizontal, vertical)
    @horizontal = horizontal
    @vertical = vertical
    @possible_moves = possible_moves_for_one_turn
  end

  private

  def possible_moves_for_one_turn
    array_of_possible_positions = []

    POSSIBLE_MOVES.each do |turn|
      array_of_possible_positions << [turn[0] + horizontal, turn[1] + vertical]
    end

    clear_overboard(array_of_possible_positions)
  end

  def clear_overboard(positions)
    positions.reject do |position|
      position[0].negative? ||
        position[0] > 7 ||
        position[1].negative? ||
        position[1] > 7
    end
  end
end

# knight = Knight.new(2, 1)
# p knight.possible_moves_for_one_turn
