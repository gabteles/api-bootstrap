# External dependencies
require 'json'
require 'bundler'
Bundler.require

ActiveSupport::Dependencies.autoload_paths = ['src', 'src/lib']
