# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# users = User.create([
#   { name: 'Greg Simmmons',   email: 'greg.simmmons62@example.com',   password: '123456',   avatar: 'http://api.randomuser.me/portraits/men/58.jpg' },
#   { name: 'Todd Simmons',    email: 'todd.simmons42@example.com',    password: 'splash',   avatar: 'http://api.randomuser.me/portraits/men/22.jpg' },
#   { name: 'Yolanda Ford',    email: 'yolanda.ford2@example.com',     password: 'adam12',   avatar: 'http://api.randomuser.me/portraits/women/25.jpg' },
#   { name: 'Nora May',        email: 'nora.may33@example.com',        password: 'custom',   avatar: 'http://api.randomuser.me/portraits/women/56.jpg' },
#   { name: 'Arthur Herrera',  email: 'arthur.herrera73@example.com',  password: 'factory',  avatar: 'http://api.randomuser.me/portraits/men/11.jpg' },
#   { name: 'Pauline Barrett', email: 'pauline.barrett67@example.com', password: 'chinaz',   avatar: 'http://api.randomuser.me/portraits/women/44.jpg' },
#   { name: 'Ronald Horton',   email: 'ronald.horton70@example.com',   password: 'andersen', avatar: 'http://api.randomuser.me/portraits/men/94.jpg' },
#   { name: 'Julian Phillips', email: 'julian.phillips64@example.com', password: 'visual',   avatar: 'http://api.randomuser.me/portraits/men/95.jpg' },
#   { name: 'Harold Holland',  email: 'harold.holland87@example.com',  password: 'michael',  avatar: 'http://api.randomuser.me/portraits/men/83.jpg' },
#   { name: 'Felecia Schmid',  email: 'felecia.schmidt88@example.com', password: 'moonligh', avatar: 'http://api.randomuser.me/portraits/women/82.jpg' },
# ])

h = 
  {
    title: 'Comfort Hotel', 
    rating: 3, 
    breakfast: true, 
    room_description: 'Each room at Comfort Hotel includes classical interior with brown and beige colours. All rooms come with a flat-screen TV, and bathrooms have a shower.', 
    price: 30, 
    user_id: '',
    picture: 'db/seeds/19648975.jpg', 
    address_attributes: { 
      country: 'Ukraine', 
      state: 'LV', 
      city: 'Lviv', 
      street: 'Heroyiv Krut Street 1v' }
  },


  hotel = Hotel.new(
    title:            h.title,
    rating:           h.rating,
    breakafast:       h.breakfast,
    room_description: h.room_description,
    price:            h.price,
    user_id:          rand(1..10),
    address_attributes: {
      country:        h.address[:country],
      state:          h.address[:state],
      city:           h.address[:city],
      street:         h.address[:street],
    })
 
  image_src = File.join(Rails.root, h.picture)
  image_name = (Time.now.to_i.to_s +
                File.extname(image_src.original_filename)).downcase
  File.open(Rails.root.join('public', 'uploads', image_name), 'wb') do |file|
    file.write(image_src.read)
  end
  hotel.picture = image_name
  hotel.save
