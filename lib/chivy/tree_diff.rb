require 'hashdiff'

module Chivy
  class TreeDiff

    attr_accessor :tree_a, :tree_b

    def initialize(tree_a, tree_b)
      self.tree_a = tree_a
      self.tree_b = tree_b
    end

    def diff

    end
  end
end
