require 'spec_helper'

describe Booking do
  
  let!(:resource) { Resource.create(name: "Centre court") }
  

  it 'displays a link for the user to enter a new booking' do
    visit '/'
    expect(page).to have_link 'Add booking'
  end

  context 'validates the booking' do

    it 'for start time' do
      visit '/'
      click_link 'Add booking'
      expect(page).to have_css 'input', 'Start time'
      expect(page).to have_css 'input', 'Length of booking'
      expect(page).to have_button 'Submit'
    end

    it 'for length of booking' do
      visit '/'
      click_link 'Add booking'
      expect(page).to have_css 'input', 'Start time'
      expect(page).to have_css 'input', 'Length of booking'
      expect(page).to have_button 'Submit'
    end

  end

  context 'creates a new booking' do

    let!(:resource) { FactoryGirl.create(:resource) }
    # let!(:booking)  { FactoryGirl.create(:booking)  }

    it 'displays the end time of a booking' do
      visit new_resource_booking_path(resource)
      # raise page.html
      select '2013', from: 'booking_start_time_1i'
      select 'October', from: 'booking_start_time_2i'
      select '30', from: 'booking_start_time_3i'
      select '09', from: 'booking_start_time_4i'
      select '09', from: 'booking_start_time_5i'

      fill_in 'Length of booking in hours', with: '1'

      click_button 'Submit'
      expect(page).to have_content DateTime.new(2013,10,30,9,0,0).strftime('%e %b %Y %H:%m%p')
    end
  end
end