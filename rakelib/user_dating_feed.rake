namespace :users do
  task :dating_feed do
    Rake::Task["create:users"].invoke

    puts "User Name"
    user_name = STDIN.gets.strip
    user = User.find_by_name(user_name)

    UserFeedService.new(user).start

    puts "Printing All Matches"

    DatingMatch.all_matched_user_ids_for_user(user).each do |match_user_id|
      puts User.find_by_id(match_user_id).inspect
    end
  end
end

