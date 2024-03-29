if (RUBY_VERSION.split('.')[1].to_i > 8)
    begin
        require 'simplecov'
        SimpleCov.start
    rescue LoadError
    end
end

$:.unshift File.expand_path("../../lib", __FILE__)
$:.unshift File.expand_path("../", __FILE__)
require 'rubygems'
require 'rspec'

require "sequel"
require 'sequel_join_getter'

# need a test database connection, this is just in-memory
Sequel.sqlite
