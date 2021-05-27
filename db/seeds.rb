# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create characters
hermes = User.create!(name: 'Hermes', email: 'hermes@hades.net', password: 'sooperfast', password_confirmation: 'sooperfast')
hades = User.create!(name: 'Hades', email: 'hades@hades.net', password: 'myhouse', password_confirmation: 'myhouse')
zagreus = User.create!(name: 'Zagreus', email: 'zagreus@hades.net', password: 'gottagetout', password_confirmation: 'gottagetout')
meg = User.create!(name: 'Meg', email: 'meg@hades.net', password: 'protectthishouse', password_confirmation: 'protectthishouse')
thanatos = User.create!(name: 'Thanatos', email: 'thanatos@hades.net', password: 'deathapproaches', password_confirmation: 'deathapproaches')
charon = User.create!(name: 'Charon', email: 'charon@hades.net', password: 'riverstyx', password_confirmation: 'riverstyx')
zeus = User.create!(name: 'Zeus', email: 'zeus@elysium.net', password: 'lightningstrikes', password_confirmation: 'lightningstrikes')
aphrodite = User.create!(name: 'Aphrodite', email: 'aphrodite@elysium.net', password: 'eyesonme', password_confirmation: 'eyesonme')
dionysus = User.create!(name: 'Dionysus', email: 'dionysus@elysium.net', password: 'time2party', password_confirmation: 'time2party')
vip_shade = User.create!(name: 'VIP Shade', email: 'justvisiting@hades.net', password: 'betweenlife&death', password_confirmation: 'betweenlife&death')

# Add profile pics
hermes.profile_pic.attach(io: File.open('app/assets/images/seed_profiles/hermes.jpg'), filename: 'hermes.jpg', content_type: ['image/jpg', 'image/png'])
hades.profile_pic.attach(io: File.open('app/assets/images/seed_profiles/hades.png'), filename: 'hades.png', content_type: ['image/jpg', 'image/png'])
zagreus.profile_pic.attach(io: File.open('app/assets/images/seed_profiles/zagreus.png'), filename: 'zagreus.png', content_type: ['image/jpg', 'image/png'])
meg.profile_pic.attach(io: File.open('app/assets/images/seed_profiles/meg.jpg'), filename: 'meg.jpg', content_type: ['image/jpg', 'image/png'])
thanatos.profile_pic.attach(io: File.open('app/assets/images/seed_profiles/thanatos.jpg'), filename: 'thanatos.jpg', content_type: ['image/jpg', 'image/png'])
charon.profile_pic.attach(io: File.open('app/assets/images/seed_profiles/charon.png'), filename: 'charon.png', content_type: ['image/jpg', 'image/png'])
zeus.profile_pic.attach(io: File.open('app/assets/images/seed_profiles/zeus.png'), filename: 'zeus.png', content_type: ['image/jpg', 'image/png'])
aphrodite.profile_pic.attach(io: File.open('app/assets/images/seed_profiles/aphrodite.jpg'), filename: 'aphrodite.jpg', content_type: ['image/jpg', 'image/png'])
dionysus.profile_pic.attach(io: File.open('app/assets/images/seed_profiles/dionysus.png'), filename: 'dionysus.png', content_type: ['image/jpg', 'image/png'])
vip_shade.profile_pic.attach(io: File.open('app/assets/images/shades.png'), filename: 'dionysus.png', content_type: ['image/jpg', 'image/png'])

# Create posts
first_post = hermes.posts.create(body: 'Of course I made the first post. Are you surprised? Now I\'ve gotta run, buh bye!')
second_post = hades.posts.create(body: 'With the first post, I - Hades, leader of this house - would like to welcome you all.')
third_post = charon.posts.create(body: 'Hoohhhhhhhh....')
fourth_post = zeus.posts.create(body: 'Hail, brother! I\'m pleased to see you finally get online after all these thousands of years.')
fifth_post = dionysus.posts.create(body: 'Heyyy everybody, who wants to have a party?')
sixth_post = meg.posts.create(body: 'Ugh. What is this house becoming...?')
seventh_post = thanatos.posts.create(body: 'Another one down.')
eighth_post = zagreus.posts.create(body: 'Does anyone here know anything about an, err, talking skeleton?')
ninth_post = aphrodite.posts.create(body: 'Whoops, my phone must have taken this picture by itself! Oh well, I guess I\'ll keep it up, might delete later.')
ninth_post.photo.attach(io: File.open('app/assets/images/aphrodite_selfie.jpg'), filename: 'aphrodite_selfie.jpg', content_type: ['image/jpg', 'image/png'])

# Create post comments
second_post.comments.create(body: 'Whoops, looks like I was a little too fast for you.', user_id: 1)
second_post.comments.create(body: 'Hohoho, how embarrassing, brother!', user_id: 7)
fifth_post.comments.create(body: 'Ooh yes, love!', user_id: 8)
seventh_post.comments.create(body: 'Thanatos, you don\'t have to post every time you take down a new target.', user_id: 4)
eighth_post.comments.create(body: 'Don\'t know anything about that, nope!', user_id: 1)
