require 'spec_helper'

describe Booking do 
  before do
    t = Time.local(2013,10,29,8,0,0)
    Timecop.travel(t)
  end

  let!(:resource) { FactoryGirl.create(:resource)  }

  it 'displays a link for the user to enter a new booking' do
    visit '/'
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
      visit new_resource_booking_path(resource)
      select '2013', from: 'booking_start_time_1i'
      select 'October', from: 'booking_start_time_2i'
      select '27', from: 'booking_start_time_3i'
      select '09', from: 'booking_start_time_4i'
      select '00', from: 'booking_start_time_5i'
      fill_in 'Length of booking in hours', with: '1'
      click_button 'Submit'

      expect(page).to have_content "Start time can\'t be in the past"
    end

  end

  context 'creates, displays, updates and deletes a booking' do

    it 'displays the end time of a booking when a booking is created' do
      visit new_resource_booking_path(resource)
      select '2013', from: 'booking_start_time_1i'
      select 'October', from: 'booking_start_time_2i'
      select '30', from: 'booking_start_time_3i'
      select '09', from: 'booking_start_time_4i'
      select '00', from: 'booking_start_time_5i'

      fill_in 'Length of booking in hours', with: '1'

      click_button 'Submit'
      expect(page).to have_content DateTime.new(2013,10,30,10,0,0).strftime('%e %b %Y %I:%M%p')
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