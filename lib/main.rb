# frozen_string_literal: true

require_relative 'moves_tree'

def knight_moves(start, finish)
  search_tree = KnightMoveSearchTree.new(Knight.new(start))
  knight_on_finish = nil
  loop do
    # Successful search returns a single knight object instead of a whole layer.
    break knight_on_finish = search_tree.search(finish) if
      search_tree.search(finish).is_a?(Knight)

    # Proceed generating new possible moves and search there.
    search_tree.descend_layer_for_search
    search_tree.search(finish)
  end

  # I wish it was more elegant ... :(
  path = knight_on_finish.previous_coordinates.flatten.each_slice(2).to_a
  output(path, start, finish)
end

def output(path, start, finish)
  puts '---------------------------------------------------------------------'
  puts "The shortest path from #{start} to #{finish} is #{path.length} turns:"
  puts ''
  path.each { |step| print "#{step} => " }
  puts finish.to_s
  puts '---------------------------------------------------------------------'
end

knight_moves([0, 0], [7, 7])
