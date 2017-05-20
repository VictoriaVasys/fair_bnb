
class Seed

  def initialize
    generate_users
    generate_room_types
    generate_properties_for_users
    generate_reservations_for_users
  end

  def generate_users
    1000.times do |i|
      User.create!(
        email: Faker::Internet.email,
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        image_url: Faker::Avatar.image,
        phone_number: Faker::PhoneNumber.cell_phone,
        description: Faker::Lorem.paragraph,
        hometown: Faker::Address.city,
        role: 0,
        active?: true,
        password: "password"
        )
      puts "#{i} user created"
    end
  end

  def generate_room_types
    RoomType.create(name: 0)
    RoomType.create(name: 1)
    RoomType.create(name: 2)
  end

  def generate_properties_for_users
    500.times do |i|
      num = Random.new.rand(1..10)
      user = User.find(Random.new.rand(1..1000))
      user.properties.create!(
        name: Faker::Company.name,
        number_of_guests: (num * 2),
        number_of_beds: (num + 2),
        number_of_rooms: num,
        description: Faker::Hipster.paragraph,
        price_per_night: Faker::Commerce.price,
        address: Faker::Address.street_address,
        city: Faker::Address.city,
        state: Faker::Address.state,
        zip: Faker::Address.zip,
        lat: Faker::Address.latitude,
        long: Faker::Address.longitude,
        image_url: Faker::LoremPixel.image,
        status: 1,
        room_type_id: Random.new.rand(1..3)
        )
      puts "#{i} property created"
    end
  end

  def generate_reservations_for_users
    500.times do |i|
      user = User.find(Random.new.rand(1..1000))
      property = Property.find(Random.new.rand(1..500))
      length_of_stay = Random.new.rand(1..5)
      total = (property.price_per_night * length_of_stay)
      begin_date = Faker::Date.forward(23)
      user.reservations.create!(
        total_price: total,
        start_date: begin_date,
        end_date: begin_date + Random.new.rand(1..10),
        number_of_guests: Random.new.rand(1..5),
        property_id: property.id,
        renter_id: user.id,
        status: Random.new.rand(0..2)
        )
      puts "#{i} reservation created"
    end
  end
end

Seed.new
