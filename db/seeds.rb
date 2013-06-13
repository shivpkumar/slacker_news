20.times do
  User.create(username:   Faker::Internet.user_name,
              password:   'password',
              first_name: Faker::Name.first_name,
              last_name:  Faker::Name.last_name,
              email:      Faker::Internet.email)
end

50.times do 
  Post.create(title:   Faker::Lorem.sentence,
              content:    Faker::Lorem.paragraphs,
              user_id: rand(1..20))
end

200.times do
  Comment.create(comment: Faker::Lorem.paragraph,
                 post_id: rand(1..50))
end
