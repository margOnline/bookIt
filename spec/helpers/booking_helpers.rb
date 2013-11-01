def invalid_length_booking
  visit new_resource_booking_path(resource)
  select '2013', from: 'booking_start_time_1i'
  select 'October', from: 'booking_start_time_2i'
  select '30', from: 'booking_start_time_3i'
  select '09', from: 'booking_start_time_4i'
  select '00', from: 'booking_start_time_5i'
  
  click_button 'Submit'
end