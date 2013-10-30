require 'spec_helper'

describe Booking do  

    
  let!(:resource) { FactoryGirl.create(:resource)  }

  it 'displays a link for the user to enter a new booking' do
    visit '/'
    expect(page).to have_link 'Add booking'
  end

  context 'validates the booking' do
    
    it 'for booking length' do
      visit new_resource_booking_path(resource)
      select '2013', from: 'booking_start_time_1i'
      select 'October', from: 'booking_start_time_2i'
      select '30', from: 'booking_start_time_3i'
      select '09', from: 'booking_start_time_4i'
      select '00', from: 'booking_start_time_5i'
      click_button 'Submit'
      expect(page).to have_content 'Length can\'t be blank'
    end

    it 'start_time cannot be before the present time' do
      visit new_resource_booking_path(resource)
      select '2013', from: 'booking_start_time_1i'
      select 'October', from: 'booking_start_time_2i'
      select '29', from: 'booking_start_time_3i'
      select '09', from: 'booking_start_time_4i'
      select '00', from: 'booking_start_time_5i'
      expect(page).to have_button 'Submit'
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
      expect(page).to have_content DateTime.new(2013,10,30,9,0,0).strftime('%e %b %Y %H:%m%p')
    end

    it 'deletes a booking' do
      booking = FactoryGirl.create(:booking)  
      original_booking_count = Booking.count

      visit resource_bookings_path(resource)
      click_link 'Delete'
      expect(Booking.count).to eq original_booking_count - 1
    end
  end


end