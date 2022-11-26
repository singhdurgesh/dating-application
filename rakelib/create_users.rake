require 'byebug'

namespace :create do
  # create users from a file with data
  # User Name
  # Age
  # Gender
  # Interests

  # From file located at data/users.txt

  task :users do
    File.open('data/users.txt', 'r') do |file|
      name, age, gender, interests, location = nil
      # Read the file with 5 lines at a time
      file.each_slice(5) do |lines|
        name = lines[0].strip
        age = lines[1].strip.to_i
        gender = lines[2].strip
        interests = lines[3].strip.split(',').map(&:strip)
        location = lines[4].strip.split(',').map(&:strip).map(&:to_i)
        user = User.new(name: name, age: age, gender: gender, interests: interests, location: { x: location[0], y: location[1] })
      end
    end
  end
end
