require 'faker'

# Clear existing data (optional, only for development)
User.delete_all
KudosSent.delete_all

# Create 100 users
users = []
100.times do
  users << User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    points: 0
  )
end

# Create 220 KudosSent entries (adjust as needed)
220.times do
  sender = users.sample
  receiver = (users - [sender]).sample
  KudosSent.create!(
    sender_id: sender.id,
    receiver_id: receiver.id,
    message: Faker::Lorem.sentence(word_count: rand(5..15)),
    points: rand(1..20),
    processed: false
  )
end

puts "Seeded #{User.count} users and #{KudosSent.count} kudos entries."
