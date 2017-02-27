# Simplecov setup

require 'simplecov'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::HTMLFormatter,
  # Coveralls::SimpleCov::Formatter
])

SimpleCov.start do
  filters.clear

  add_filter do |src|
    !(src.filename =~ /^#{SimpleCov.root}\/(app|api|lib)/)
  end

  add_group 'Application', File.join(SimpleCov.root, 'app')
  add_group 'API', File.join(SimpleCov.root, 'api')
  add_group 'Libraries', File.join(SimpleCov.root, 'lib')
end

# Loads application

require_relative '../main.rb'

# Force all files to be eager loaded

Dir['{api,app,lib}/**/*.rb'].each do |file|
  require_relative("../#{file}")
end

# Spec helpers

Dir['spec/helpers/**/*.rb'].each { |file|
  relative_file = file.sub('spec/', '')
  require_relative(relative_file)
}
