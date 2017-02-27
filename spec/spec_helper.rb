require_relative '../main.rb'
Dir['spec/helpers/**/*.rb'].each { |file|
  relative_file = file.sub('spec/', '')
  require_relative(relative_file)
}
