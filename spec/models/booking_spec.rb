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
    start_time = DateTime.new(2013,10,30,9,9,9)
    length = 2
    expect(booking.calculate_end_time).to eq (start_time + (2.hours))
  end

  
end