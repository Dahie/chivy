require 'hashdiff'

module Chivy
  class TreeDiff

    attr_accessor :tree_a, :tree_b, :diffs

    def initialize(tree_a, tree_b)
      @tree_a = tree_a
      @tree_b = tree_b
      @diffs = HashDiff.diff(tree_a, tree_b)
    end

    def each(&block)
      diffs.each do |diff_set|
        block.call(diff_set) if relevant_change?(diff_set)
      end
    end

    def relevant_change?(diff_set)
      diff_set[0] == '-' ||
        diff_set[0] == '+' ||
        diff_set[2] == nil ||
        diff_set[3] == nil
    end
  end
end
