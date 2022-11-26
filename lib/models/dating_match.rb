require_relative 'concerns/has_id'
# Path: lib/models/dating_match.rb

class DatingMatch
  include HasId
  attr_accessor :first_user_id, :second_user_id

  # Class methods

  class << self
    def all_matched_user_ids_for_user(user)
      first_matches = all.select { |_, match| match.first_user_id == user.id }
      second_matches = all.select { |_, match| match.second_user_id == user.id }

      first_matches.map { |_, match| match.second_user_id } + second_matches.map { |_, match| match.first_user_id }
    end
  end

  # Instance methods

  def initialize(options = {})
    @first_user_id = options[:first_user_id]
    @second_user_id = options[:second_user_id]
    super
  end
end
