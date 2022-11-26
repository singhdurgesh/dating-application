class UserFeedService
  def initialize(user)
    @user = user
    @all_potential_matches = []
  end

  def each
    # Find all the potential matches
    # Add them to @all_potential_matches
    # Yield each match to the block
    PotentialMatchService.new.find_potential_matches_for_user(@user).each do |match_user|
      yield match_user.last
    end
  end

  def start
    each do |match_user|
      puts "Potential Match: #{match_user.inspect}"
      puts "To accept, type 'A' and to skip, type 'S' and to quit, type 'Q'"
      action = STDIN.gets.strip
      case action
      when 'A'
        DatingMatch.new(first_user_id: @user.id, second_user_id: match_user.id)
        puts "Match created"
      when 'S'
        puts "Match skipped"
      when 'Q'
        break
      end
    end
  end
end
