require 'yaml'

module Chivy
  class Tree

    # Forwarding methods to the @tree
    extend Forwardable

    def_delegator :@tree, :[]
    def_delegator :@tree, :[]=
    def_delegator :@tree, :to_yaml
    def_delegator :@tree, :as_yaml
    def_delegator :@tree, :==
    def_delegator :@tree, :eql

    attr_accessor :file, :locale, :name, :tree

    def load(file)
      @file = file
      @tree = ::YAML.load_file(file)[locale] if file
      @tree
    end


    # returns self (instance of Answers) after building the tree by
    # its template
    def initialize(filename)
      build_tree
      split_filename = filename.split('.')
      @locale = split_filename[-2]
      @name = split_filename.first
    end


    # returns the tree as an instance of Hash
    def build_tree
      @tree = {}
    end

    # returns a yaml string of the answers
    def self.dump(answers)
      data.to_yaml
    end


    # returns an answer-intance from the yaml string
    def self.load(string)
      data = Tree.new
      data.load(string)
    end

  end
end
