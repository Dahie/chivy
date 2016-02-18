module Chivy
  class TreeManager

    TRANSLATION_YML_REGEX = /(\S*)\.(\S*)(.yml)/


    attr_accessor :files, :folder, :loaded_files, :base_locales, :base_names


    def initialize(folder, files)
      @files = files
      @folder = folder
      @base_names = {}
      @base_locales = {}
      @loaded_files = []
    end

    # returns files successfully loaded
    def self.load(folder, files)
      tree_manager = TreeManager.new(folder, files)
      tree_manager.fill
      tree_manager
    end

    def each_base_name &block
      base_names.each do |name, trees|
        trees.each do |tree|
          block.call(tree)
        end
      end
    end

    def each_base_name_permutation &block
      each_base_name do |reference_tree|
        each_base_name do |tree|
          block.call(reference_tree, tree)
        end
      end
    end


    def fill
      files.each do |filename|
        if filename.match TRANSLATION_YML_REGEX
          translation = TranslationFile.new filename
          translation.load File.join(folder, filename)
          loaded_files << filename
          add_base_name translation
          add_base_locale translation
        end
      end
    end

    protected


    def add_base_name(tree)
      if base_names.include? tree.name
        base_names[tree.name] << tree
      else
        base_names[tree.name] = [tree]
      end
    end

    def add_base_locale(tree)
      if base_locales.include? tree.locale
        base_locales[tree.locale] << tree.name
      else
        base_locales[tree.locale] = [tree.name]
      end
    end
  end
end
