require 'spec_helper'

describe Booking do
  before do
    t = Time.local(2013,10,29,8,0,0)
    Timecop.travel(t)
  end
  let!(:resource) { Resource.new(name: 'Court 1') }
  let!(:booking) { Booking.new(start_time: DateTime.now, length: 1) }

  subject{ booking }

  it { should respond_to(:start_time) }

  context "should not be valid when" do
    it "a length is not provided" do
      booking = Booking.new(start_time: DateTime.now)
      add_reference resource, booking

      expect(booking).to_not be_valid
    end

    it "a start time is not provided" do
      booking = Booking.new(length: 1)
      add_reference resource, booking

      expect(booking).to_not be_valid
    end

    it "both a start and a length are not provided" do
      booking = Booking.new()
      add_reference resource, booking

      expect(booking).to_not be_valid
    end

    it 'a start time that is in the past is provided' do
      booking = Booking.new(start_time: DateTime.new(2013,10,27,9,9,0), length: 1 )
      add_reference resource, booking

      expect(booking.errors.full_messages).to include "Start time cannot be in the past"
    end

    it "a start time that is less than 15 minutes in the future is provided" do
      booking = Booking.new( start_time: DateTime.now + (2.minutes), length: 1 )
      add_reference resource, booking

      expect(booking).to_not be_valid
    end
  end

  context 'should be valid with' do
    it 'a start time, length, and resource' do
      booking = Booking.new(start_time: DateTime.now + (1.hours), length: 1)
      add_reference resource, booking

      expect(booking).to be_valid
    end

    it 'a start time that is at least 15 minutes in the future' do
      booking = Booking.new(start_time: DateTime.now + (15.minutes), length: 1)
      add_reference resource, booking

      expect(booking).to be_valid
    end
  end

  it 'calculates an end time from the start time and the length' do
    booking.start_time = DateTime.new(2013,10,30,9,9,0)
    booking.length = 2

    expect(booking.calculate_end_time).to eq (booking.start_time + (2.hours))
  end

  
end