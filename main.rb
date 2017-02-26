# External dependencies
require 'json'
require 'bundler'
Bundler.require

# Business Core

Dir['lib/**/*.rb'].each {|file| require_relative("./#{file}") }

module App
  autoload_directories(false, 'app')
end

Dir['initializer/**/*.rb'].each {|file| require_relative("./#{file}") }

# Exposures

module API
  autoload_directory(false, 'api')
end
