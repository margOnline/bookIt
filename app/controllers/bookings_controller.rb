class BookingsController < ApplicationController

   before_action :find_resource

  def index
    @bookings = Booking.all.where(resource_id: @resource.id)
  end

  def new
    @booking = Booking.new(resource_id: @resource.id)
  end

  def create
    # end_time = calculate_end_time(params[:start_time],params[:booking_length])
    @booking = Booking.new(params[:booking].permit(:resource_id, :start_time, :end_time))
    @booking.resource = @resource

     if @booking.save
      flash[:notice] = 'booking added'
      redirect_to(:action => 'index', :resource_id => @resource.id)
    else
      render 'new'
    end
  end

  private
    
  def find_resource
    if params[:resource_id]
      @resource = Resource.find_by_id(params[:resource_id])
    end
  end

  # def calculate_end_time(start_time,booking_length)
  #   end_time = start_time.strftime(%Y) + booking_length
  # end


end
