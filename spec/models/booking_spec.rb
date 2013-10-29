require 'spec_helper'

describe Booking do

  let(:booking) { Booking.create(start_time: DateTime.now, end_time: DateTime.now + (60*60*24)) }

  subject(booking)

  it { should respond_to(:start_time) }
  it { should respond_to(:end_time) }

  it "should have a start time" do
    expect(booking.start_time).to be_an_instance_of DateTime
  end

  context "without a start time" do
    before { booking.start_time = " " }

    it "should not be valid" do
      expect(booking).to_not be_valid
    end
  end 
end