# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
path = Rails.root.join('test', 'fixtures', 'users.yml')
yaml = YAML.load_file(path)

yaml.each do |label, hash|
  user = User.find_by(email: hash['email'])
  if user.nil?
    puts "Creating #{label}"
    User.create(hash)
  end
end
