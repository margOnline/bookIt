class BookingsController < ApplicationController

  def new
    @resource = Resource.find params[:resource_id]
    # @booking = @resource.bookings.new
  end
end
