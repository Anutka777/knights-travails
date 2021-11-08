# frozen_string_literal: true

require_relative 'knight'

# - Layer-by-layer builded tree of potentional knight positions.
# - Holds knight object on start.
# - Holds list of all knight objects after next possible move -
# called "layer" in code.
# - Searches for particular coordinates in that list
# - Builds a list of all potentional knight objects after
# all next possible moves (and then after next moves,
# and next ... and so on) - process called "descending" in code.
class KnightMoveSearchTree
  def initialize(knight)
    @root = knight
    @current_layer = generate_layer_from_root
  end

  def search(coordinates)
    @current_layer.each do |knight|
      return knight if knight.current_coordinates == coordinates
    end
  end

  def descend_layer_for_search
    next_layer = []
    @current_layer.each do |knight|
      knight.possible_coordinates.each do |coordinates|
        next_layer << Knight.new(coordinates, [knight.previous_coordinates] <<
          knight.current_coordinates)
      end
    end
    @current_layer = next_layer
  end

  private

  def generate_layer_from_root
    current_layer = []
    @root.possible_coordinates.each do |coordinates|
      current_layer << Knight.new(coordinates, @root.current_coordinates)
    end
    current_layer
  end
end
