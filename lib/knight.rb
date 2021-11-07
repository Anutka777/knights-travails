# frozen_string_literal: true

# Knight's coordinates
class Knight
  attr_reader :current_coordinates, :possible_coordinates
  attr_accessor :previous_coordinates

  POSSIBLE_MOVES = [
    [2, 1], [1, 2], [-1, 2], [-2, 1], [-2, -1], [-1, -2], [1, -2], [2, -1]
  ].freeze

  def initialize(current_coordinates, previous_coordinates = [])
    @current_coordinates = current_coordinates
    @possible_coordinates = find_possible_coordinates
    @previous_coordinates = previous_coordinates
  end

  private

  def find_possible_coordinates
    potential_coordinates = []
    POSSIBLE_MOVES.each do |move|
      potential_coordinates << [
        move[0] + @current_coordinates[0],
        move[1] + @current_coordinates[1]
      ]
    end
    delete_overboard(potential_coordinates)
  end

  def delete_overboard(coordinates)
    coordinates.reject do |coordinate|
      coordinate[0].negative? ||
        coordinate[1].negative? ||
        coordinate[0] > 7 ||
        coordinate[1] > 7
    end
  end
end
