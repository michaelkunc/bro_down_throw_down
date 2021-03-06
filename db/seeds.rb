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

Relationship.create!({challenger: User.first, challenged: User.second})

10.times do
  Relationship.create!({challenger: User.all.sample,
                        challenged: User.all.sample})
end


styles = ['Brazilian Jiu-Jitsu', 'Kung Fu', 'Krav Maga', 'Dirty Boxing', 'Flamethrowing', 'Brass Knuckles', 'MMA', 'Judo', 'Savate', 'Muy Thai', 'Juggling', 'Laser/Repulsor Rays', 'Knife Fighting', 'Dance Off']

styles.each do |style|
  Style.create!({name: style,
                description: Faker::Lorem.paragraph(4),
                category: "Unarmed"})
end

100.times do
Skill.create!({user: User.all.sample,
              style: Style.all.sample})
end