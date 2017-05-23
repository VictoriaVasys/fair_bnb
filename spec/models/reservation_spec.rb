require 'rails_helper'

RSpec.describe Reservation, type: :model do
  context "reservation is valid with all attributes" do
    before do
      room_type = create(:room_type)
      @property = create(:property, room_type: room_type)
      @user = create(:user)
    end

    it { should validate_presence_of(:total_price) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
    it { should validate_presence_of(:number_of_guests) }
    it { should validate_presence_of(:status) }
    it { should belong_to :property }
    it { should belong_to :renter }
  end

  describe "validations" do
    it "is invalid without total_price" do
      reservation = build(:reservation, total_price: nil, renter: @user, property: @property)
      expect(reservation).to_not be_valid
    end
    it "is invalid without start_date" do
      reservation = build(:reservation, start_date: nil, renter: @user, property: @property)
      expect(reservation).to_not be_valid
    end
    it "is invalid without end_date" do
      reservation = build(:reservation, end_date: nil, renter: @user, property: @property)
      expect(reservation).to_not be_valid
    end
    it "is invalid without number_of_guests" do
      reservation = build(:reservation, number_of_guests: nil, renter: @user, property: @property)
      expect(reservation).to_not be_valid
    end
    it "is invalid without status" do
      reservation = build(:reservation, status: nil, renter: @user, property: @property)
      expect(reservation).to_not be_valid
    end
    it "is invalid without renter" do
      reservation = build(:reservation, renter: nil, property: @property)
      expect(reservation).to_not be_valid
    end
    it "is invalid without property" do
      reservation = build(:reservation, property: nil, renter: @user)
      expect(reservation).to_not be_valid
    end
  end

  describe "model methods" do
    before :each do
      @reservation = create(:reservation)
      @reservation2 = create(:reservation, number_of_guests: 2)
      @property = @reservation.property
    end
    it "returns reservation's property's city" do
      expect(@reservation.city).to eq(@property.city)
    end
    it "returns formatted check in and check out dates" do
      expect(@reservation.check_in_date).to eq("May 16, 2017")
      expect(@reservation.check_out_date).to eq("May 17, 2017")
    end
    it "returns pluralized guests" do
      expect(@reservation.guests).to eq("1 guest")
      expect(@reservation2.guests).to eq("2 guests")
    end
    it "returns reservation's property's name" do
      expect(@reservation.title).to eq(@property.name)
    end
    it "returns reservation's property's image" do
      expect(@reservation.image_url).to eq(@property.image_url)
    end
  end
end
