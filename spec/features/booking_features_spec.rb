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

  describe 'Creating a booking' do
    context 'is not valid when' do
      it 'the booking length field is empty' do
        invalid_length_booking

        expect(page).to have_content "Length can\'t be blank"
      end

      it 'the booking start time is in the past' do
        invalid_time_booking

        expect(page).to have_content "Start time can\'t be in the past"
      end
    end

    context 'is valid when' do
      it 'booking length field has been filled in and start time is in the future' do
        valid_booking
        date_string = DateTime.new(2013,10,30,10,0,0).strftime('%e %b %Y %I:%M%p')
        
        expect(page).to have_content 
      end
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