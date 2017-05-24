FactoryGirl.define do
  # factory :identity do
  #   user nil
  # end

  factory :room_type do
    name 0
  end

  factory :user do
    first_name Faker::User.name
    last_name Faker::Music.instrument
    image_url Faker::Fillmurray.image
    sequence(:email) { |n| Faker::Internet.email("sample#{n}") }
    phone_number Faker::PhoneNumber.cell_phone
    description Faker::RuPaul.quote
    hometown Faker::Address.city
    role 0
    active? false
    password "password"
    facebook_token ENV['FACEBOOK_USER_TOKEN']
    factory :user_with_reservations do
      reservations {create_list(:reservation_with_status, 5)}
    end
  end

  factory :property_availability do
    sequence :date do |n|
      "2017-07-#{n}"
    end
    reserved? false
    property
    factory :property_with_reservations do
      reserved? true
    end
  end

  factory :reservation do
    total_price "9.99"
    start_date "2017-05-16"
    end_date "2017-05-17"
    number_of_guests 1
    property
    association :renter, factory: :user
    status 1
    factory :reservation_with_status do
      # enum status: %w(pending confirmed in_progress finished declined)
      sequence :status do |n|
        if n % 5 == 0
          0
        elsif n % 5 == 1
          1
        elsif n % 5 == 2
          2
        elsif n % 5 == 3
          3
        elsif n % 5 == 4
          4
        else
          n
        end
      end
    end
  end

property_images= [
'app/assets/images/beach_house.jpg',
'app/assets/images/cabin_in_the_woods.jpg',
'app/assets/images/urban_cottage.jpg'
]

sequence :image_url, property_images.cycle do |n|
  "#{n}"
end

  factory :property do
    sequence :name do |n|
      Faker::GameOfThrones.city + " #{n}"
    end
    number_of_guests 1
    number_of_beds 1
    number_of_rooms 1
    number_of_bathrooms 1
    description Faker::Hipster.paragraph
    price_per_night Faker::Commerce.price
    address Faker::Address.street_address
    sequence :city do |n|
      Faker::Address.city + " #{n}"
    end
    state Faker::Address.state
    zip Faker::Address.zip
    lat "39.7392"
    long "104.9903"
    room_type
    image_url {generate(:image_url)}
    check_in_time "14:00:00"
    check_out_time "11:00:00"
    status 1
    association :owner, factory: :user
    factory :property_with_availability do
      property_availabilities {create_list(:property_availability, 3)}
    end
  end


end
