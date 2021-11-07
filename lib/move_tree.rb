# frozen_string_literal: true

require_relative 'knight'

# Move_tree
class KnightMoveSearchTree
  attr_reader :root
  attr_accessor :current_layer

  def initialize(knight)
    @root = knight
    @current_layer_for_search = layer_from_root
  end

  def search_for_finish(coordinates)
    @current_layer_for_search.each do |position|
      return position if position.current_coordinates == coordinates
    end
  end

  private

  def layer_from_root
    current_layer = []
    @root.possible_coordinates.each do |coordinates|
      current_layer << Knight.new(coordinates, @root.current_coordinates)
    end
    current_layer
  end

  public

  def descend_layer_for_search
    next_layer = []
    @current_layer_for_search.each do |knight|
      knight.possible_coordinates.each do |coordinates|
        next_layer << Knight.new(coordinates, [knight.previous_coordinates].append(knight.current_coordinates))
      end
    end
    @current_layer_for_search = next_layer
  end
end

# knight = Knight.new([0, 0])
# tree = KnightMoveSearchTree.new(knight)
# tree.descend_layer_for_search
# p tree.search_for_finish([6, 3]).kind_of?(Knight)
# tree.descend_layer_for_search
# p tree.search_for_finish([6, 3]).kind_of?(Knight)
