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

  context 'validates the booking form fields' do
    it 'for booking length' do
      invalid_length_booking

      expect(page).to have_content "Length can\'t be blank"
    end
  end

  context 'validates the start_time' do

    it 'cannot be in the past' do
      invalid_time_booking

      expect(page).to have_content "Start time can\'t be in the past"
    end

  end

  context 'creates, displays, updates and deletes a booking' do

    it 'displays the end time of a booking when a booking is created' do
      valid_booking
      date_string = DateTime.new(2013,10,30,10,0,0).strftime('%e %b %Y %I:%M%p')
      
      expect(page).to have_content 
    end

  end

  context 'deletes a booking' do

    before do
      @resource = Resource.create(name: 'Court 6')
      @booking = FactoryGirl.create(:booking, :resource_id => @resource.id)
    end

    it 'when user clicks delete link' do
      original_booking_count = Booking.count
      visit resource_bookings_path(@resource)
      click_link 'Delete'

      expect(Booking.count).to eq original_booking_count - 1
    end

  end


end