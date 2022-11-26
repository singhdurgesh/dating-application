require_relative 'concerns/has_id'
# Path: lib/models/user.rb

class User
  include HasId
  attr_accessor :name, :age, :gender, :location, :interests

  # Class methods

  class << self
    def find_by_name(name)
      User.all.find { |_, user| user.name == name }.last
    end
  end

  # Instance methods

  def initialize(options = {})
    @name = options[:name]
    @age = options[:age]
    @gender = options[:gender]
    @interests = options[:interests]
    @location = Location.new(x: options[:location][:x], y: options[:location][:y])
    super
  end

  def inspect
    puts "User: name: #{@name}, age: #{age}"
  end

  def common_interests_with(other_user)
    interests & other_user.interests
  end

  def interaction_factor_with(other_user)
    gender_factor = gender != other_user ? 1 : 0
    common_interests_factor = (interests & other_user.interests).size
    distance_factor = location.distance_to(other_user.location)

    [gender_factor, common_interests_factor, distance_factor * -1]
  end
end
