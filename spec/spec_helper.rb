# Simplecov setup

require 'simplecov'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::HTMLFormatter,
  # Coveralls::SimpleCov::Formatter
])

SimpleCov.start do
  filters.clear

  add_filter do |src|
    !(src.filename =~ /^#{SimpleCov.root}\/src\/(app|api|lib)/)
  end

  add_group 'Application', File.join(SimpleCov.root, 'src/app')
  add_group 'API', File.join(SimpleCov.root, 'src/api')
  add_group 'Libraries', File.join(SimpleCov.root, 'src/lib')
end

# Loads application

require_relative '../main.rb'

# Force all files to be eager loaded

Dir['src/{api,app,lib}/**/*.rb'].each do |file|
  require_relative("../#{file}")
end

# Spec helpers

Dir['spec/helpers/**/*.rb'].each do |file|
  relative_file = file.sub('spec/', '')
  require_relative(relative_file)
end
