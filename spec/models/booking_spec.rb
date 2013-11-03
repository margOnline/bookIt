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

  context "should not be valid without" do
    it "a length" do
      booking = Booking.new(start_time: DateTime.now)
      add_reference resource, booking

      expect(booking).to_not be_valid
    end

    it "a start time" do
      booking = Booking.new(length: 1)
      add_reference resource, booking

      expect(booking).to_not be_valid
    end

    it "a start or a length" do
      booking = Booking.new()
      add_reference resource, booking

      expect(booking).to_not be_valid
    end

    it 'a start time that is not in the past' do
      booking = Booking.new(start_time: DateTime.new(2013,10,27,9,9,0), length: 1 )
      add_reference resource, booking

      expect(booking.errors.full_messages).to include "Start time cannot be in the past"
    end

    it "a start time that is at least 15 minutes in the future" do
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