#
class Module
  BASENAME_WITHOUT_EXTENSION = lambda do |filename|
    File.basename(filename, File.extname(filename))
  end
  private_constant :BASENAME_WITHOUT_EXTENSION

  SNAKE_CASE_TO_CAMEL_CASE = lambda do |str|
    str.split('_').map(&:capitalize).join
  end
  private_constant :SNAKE_CASE_TO_CAMEL_CASE

  EXPECTED_CONSTANT_FROM_FILE = lambda do |filename|
    SNAKE_CASE_TO_CAMEL_CASE[BASENAME_WITHOUT_EXTENSION[filename]].to_sym
  end
  private_constant :EXPECTED_CONSTANT_FROM_FILE

  CREATE_MODULE_TREE = lambda do |current, mod|
    current.const_set(mod, Module.new) unless current.constants.include?(mod)
    current.const_get(mod)
  end
  private_constant :CREATE_MODULE_TREE

  REGISTER_AUTOLOAD_FILE_PATH = lambda do |root_module, slice_start|
    lambda do |filepath|
      splitted_path = filepath[slice_start..-1].split('/')
      target_name = EXPECTED_CONSTANT_FROM_FILE[splitted_path.last]
      module_tree = splitted_path[0..-2].map(&:capitalize).map(&:to_sym)

      target_module = module_tree.reduce(root_module, &CREATE_MODULE_TREE)
      target_module.autoload(target_name, filepath)
    end
  end

  def autoload_directory(inside_modules, directory)
    return unless directory.is_a?(String)

    dirpath = File.expand_path(directory)
    glob = File.join(dirpath, '**/*.rb')
    slice_start = (inside_modules ? File.dirname(dirpath) : dirpath).size + 1

    Dir[glob].each(&REGISTER_AUTOLOAD_FILE_PATH[self, slice_start])
  end

  def autoload_directories(inside_modules, *directories)
    directories.each do |directory|
      autoload_directory(inside_modules, directory)
    end
  end
end
