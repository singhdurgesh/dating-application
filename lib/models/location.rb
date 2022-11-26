# Path: lib/models/location.rb

require_relative 'concerns/has_id'
require 'byebug'
class Location
  include HasId
  attr_accessor :x, :y

  # Instance methods

  def initialize(options = {})
    @x = options[:x]
    @y = options[:y]
    super
  end

  def distance_to(location)
    Math.sqrt((@x - location.x)**2 + (@y - location.y)**2)
  end

  def inspect
    puts "Location: x: #{@x}, y: #{@y}"
  end
end
