require 'spec_helper'

describe Booking do

  let(:booking) { Booking.create(start_time: DateTime.now, length: 1 )}

  subject{booking}

  it { should respond_to(:start_time) }

  context "it should not be valid without" do
    it "a length" do
      expect(Booking.create(start_time: DateTime.now)).to_not be_valid
    end

    it "a start time" do
      expect(Booking.create(length: 1)).to_not be_valid
    end

    it "a start or a length" do
      expect(Booking.create()).to_not be_valid
    end
  end

  it 'calculates an end time from the start time and the length' do
    booking.start_time = Time.new(2013,10,30,9,9,0).to_datetime
    booking.length = 2
    expect(booking.calculate_end_time).to eq (booking.start_time + (2.hours))
  end

  it 'rejects start date if it is in the past' do
    booking = Booking.create(start_time: Time.new(2013,10,29,9,9,0), length: 1 )
    expect(booking.errors.full_messages).to include "Start time can't be in the past"
  end

  it 'accepts a start date that is 15 minutes or more in the future' do
    booking = Booking.create(start_time: Time.new(2013,10,31,9,9,0), length: 1 )
    expect(booking).to be_valid
  end

  
end