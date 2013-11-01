require 'spec_helper'

describe Booking do 
  before do
    t = Time.local(2013,10,29,8,0,0)
    Timecop.travel(t)
  end

  let!(:resource) { FactoryGirl.create(:resource)  }

  it 'displays a link for the user to enter a new booking' do
    visit root_path

    expect(page).to have_link 'Add booking'
  end

  context 'is not valid when' do
    it 'that the booking length field cannot be empty' do
      invalid_length_booking

      expect(page).to have_content "Length can\'t be blank"
    end

    it 'the booking time field cannot be in the past' do
      invalid_time_booking

      expect(page).to have_content "Start time can\'t be in the past"
    end
  end

  context 'When another booking with the same time slot exists' do
    before do
      t = Time.local(2013,10,29,8,0,0)
      Timecop.travel(t)
    end
    let(:booking){FactoryGirl.create(:booking)}

    it 'does not save to the database' do
      booking_clash booking.resource

      expect(page).to have_content "Slot has already been booked"
    end
  end 

  context 'is valid when' do
    it 'booking length field has been filled in and start time is in the future' do
      valid_booking
      
      expect(page).to have_content DateTime.new(2013,10,30,10,0,0).strftime('%e %b %Y %I:%M%p')
    end
  end

  context 'deletes a booking' do
    let!(:booking){FactoryGirl.create(:booking)}

    it 'when user clicks delete link' do
      original_booking_count = Booking.count
      visit resource_bookings_path(booking.resource_id)
      click_link 'Delete'

      expect(Booking.count).to eq original_booking_count - 1
    end
  end


end