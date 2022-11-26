class PotentialMatchService
  def initialize
    @potential_matches = []
  end

  # Order of operations:
  # 1. Gender Factor
  # 2. Common Interests Factor
  # 3. Distance Factor
  def find_potential_matches_for_user(user)
    interactions = []
    User.all.each do |_id, other_user|
      next if other_user.id == user.id

      interactions << [user.interaction_factor_with(other_user), other_user]
    end

    # puts "Interactions: #{interactions}"
    @potential_matches = interactions.sort_by! { |factor, _| factor }
  end

  def potential_matches
    @potential_matches
  end
end
