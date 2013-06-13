20.times do
  User.create(username: Faker::Internet.user_name,
              password: 'password')
end

50.times do 
  Post.create(title:   Faker::Lorem.sentence,
              content: Faker::Lorem.paragraph,
              user_id: rand(1..20))
end

200.times do
  Comment.create(comment: Faker::Lorem.sentence,
                 post_id: rand(1..50),
                 user_id: rand(1..20))
end
