def add_reference resource, booking
  booking.resource = resource
  booking.save
end
