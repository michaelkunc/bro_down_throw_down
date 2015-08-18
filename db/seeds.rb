User.create!({username: 'mjkunc',
            email: 'mjkunc@gmail.com',
            image_url: Faker::Avatar.image,
            bio: "Bringing the pain! And Cookies!",
            password: "password"})

100.times do
  User.create!({username: Faker::Internet.user_name,
              email: Faker::Internet.email,
              image_url: Faker::Avatar.image,
              bio: Faker::Lorem.paragraph(4),
              password: "password"})

end

Relationship.create!({challenger: User.all.sample, challenged: User.first})

10.times do
  Relationship.create!({challenger: User.all.sample,
                        challenged: User.all.sample})
end