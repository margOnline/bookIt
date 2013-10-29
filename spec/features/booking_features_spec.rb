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

    it 'calculates the end time for a booking' do
      visit 'resources/7/bookings'
      fill_in '' with ''
      fill_in '' with ''
      click_button 'Submit'
      expect(page).to have_content '1 hour'
    end

  end

end