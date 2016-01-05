include Faker

5.times do
  user = User.create!(
  email: Faker::Internet.safe_email,
  password: Faker::Internet.password(8),
  role: :standard
  )
end

users = User.all

10.times do
  wiki = Wiki.create!(
  title: Faker::Lorem.sentence(3),
  body: Faker::Lorem.paragraph(7)
  )
  wiki.update_attribute(:updated_at, Faker::Time.between(DateTime.now - 200, DateTime.now))
end

wikis = Wiki.all

puts "Seeding finished"
puts "#{User.count} users joined"
puts "#{Wiki.count} wikis created"
