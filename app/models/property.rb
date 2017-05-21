class Property < ApplicationRecord
  validates :name, :number_of_guests, :number_of_beds, :number_of_rooms, :description, :price_per_night, presence: true
  validates :address, :city, :state, :zip, :image_url, :status, presence: true

  belongs_to :room_type
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"

  has_many :reservations
  has_many :property_availabilities

  enum status: %w(pending active archived)

  def self.search_city_date_guests(city, date, guests)
    joins(:property_availabilities).merge(PropertyAvailability.available).where("number_of_guests >= ? AND property_availabilities.date = ? AND city LIKE ?", guests, date, city)
  end

  def self.search_city_guests(city, guests)
    where('city LIKE ? AND number_of_guests >= ?', city, guests)
  end

  def self.search_date_guests(date, guests)
    joins(:property_availabilities).merge(PropertyAvailability.available).where("number_of_guests >= ? AND property_availabilities.date = ?", guests, date)
  end

  def self.search_date_city(date, city)
    joins(:property_availabilities).merge(PropertyAvailability.available).where('city LIKE ? AND property_availabilities.date = ?', city, date)
  end

  def self.search_date(date)
    joins(:property_availabilities).merge(PropertyAvailability.available).where('property_availabilities.date = ?', date)
  end

  def self.search_city(city)
    where('city LIKE ?', city)
  end

  def self.search_guests(guests)
    where("number_of_guests >= ?", guests)
  end
end
