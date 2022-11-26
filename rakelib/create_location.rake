namespace :create do
  task :location do
    puts 'Creating location'
    location = Location.new(x: 1, y: 2)
    puts location.inspect
  end
end
