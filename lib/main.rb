# frozen_string_literal: true

require_relative 'move_tree'
require_relative 'knight'

def knight_moves(start, finish)
  tree = KnightMoveSearchTree.new(Knight.new(start))
  result = false
  loop do
    break result = tree.search_for_finish(finish) if tree.search_for_finish(finish).kind_of?(Knight)

      tree.descend_layer_for_search
     tree.search_for_finish(finish)
  end
  result
end

p knight_moves([0, 0], [7, 7])
p knight_moves([0, 6], [0, 1])
