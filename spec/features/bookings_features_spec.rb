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
      raise page.html
      expect(page).to have_button 'Submit'
    end

  end

end