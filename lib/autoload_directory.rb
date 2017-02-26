class Module
  def autoload_directory(inside_modules, directory)
    return unless directory.is_a?(String)

    dirpath = File.expand_path(directory)
    glob = File.join(dirpath, '**/*.rb')
    slice_start = (inside_modules ? File.dirname(dirpath) : dirpath).size + 1

    basename_without_extension = ->(filename) {
      File.basename(filename, File.extname(filename))
    }

    snake_case_to_camel_case = ->(str) {
      str.split('_').map(&:capitalize).join
    }

    expected_constant_from_file = ->(filename) {
      snake_case_to_camel_case[basename_without_extension[filename]].to_sym
    }

    create_module_tree = ->(current, mod) {
      current.constants.include?(mod) ? current.const_get(mod) : current.const_set(mod, Module.new)
    }

    register_autoload_filepath = ->(filepath) {
      splitted_path = filepath[slice_start..-1].split('/')
      target_name = expected_constant_from_file[splitted_path.last]
      module_tree = splitted_path[0..-2].map(&:capitalize).map(&:to_sym)

      target_module = module_tree.reduce(self, &create_module_tree)
      target_module.autoload(target_name, filepath)
    }

    Dir[glob].each(&register_autoload_filepath)
  end

  def autoload_directories(inside_modules, *directories)
    directories.each do |directory|
      autoload_directory(inside_modules, directory)
    end
  end
end
