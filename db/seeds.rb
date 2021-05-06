# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do
    city = City.create!(city_name: Faker::Address.city)
  end
  
  100.times do
    city = City.find_by(id: rand(1..City.all.length))
  
    dog = Dog.create!(name: Faker::Creature::Dog.name, 
                      city: city)
  end
  
  100.times do
    city = City.find_by(id: rand(1..City.all.length))
  
    ds = Dogsitter.create!(first_name: Faker::Name.first_name, 
                          last_name: Faker::Name.last_name,
                          city: city)
  end
  
  loop do
    city_id = rand(1..City.all.length)
  
    dog_array = Dog.where(city_id: city_id)
    dog = dog_array[rand(dog_array.length).to_i] 
  
    ds_array = Dogsitter.where(city_id: city_id)
    ds = ds_array[rand(ds_array.length).to_i]
    
    if dog_array.length != 0 && ds_array.length != 0
      stroll = Stroll.create!(dog: dog, dogsitter: ds, date: Faker::Date.forward(days: 60))
    end
  
    break if Stroll.count == 100
  end