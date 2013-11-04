def add_reference resource, new_booking
  new_booking.resource = resource
  new_booking.save
end
