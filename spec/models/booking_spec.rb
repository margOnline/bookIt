require 'spec_helper'

describe Booking do

  let(:booking) { Booking.create(start_time: DateTime.now, end_time: DateTime.now + (60*60*24)) }

  subject{ booking }

  it { should respond_to(:start_time) }
  it { should respond_to(:end_time) }
  it { should respond_to(:resources) }

  context "is not valid if it has no" do
    it "start time" do
      expect(Booking.create(end_time: DateTime.now)).to_not be_valid
    end

    it "end time" do
      expect(Booking.create(start_time: DateTime.now)).to_not be_valid
    end

    it "end and start time" do
      expect(Booking.create()).to_not be_valid
    end
  end
end