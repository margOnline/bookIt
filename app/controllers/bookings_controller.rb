class BookingsController < ApplicationController

   before_action :find_resource

  def index
    @bookings = Booking.all.where(resource_id: @resource.id)
  end

  def new
    @booking = Booking.new(resource_id: @resource.id)
  end

  def create
    @booking = Booking.create(params[:booking].permit(:resource_id, :start_time, :length))
    end_time = @booking.calculate_end_time #(@booking.start_time,@booking.length)
    @booking.resource = @resource

     if @booking.save
      flash[:notice] = 'booking added'
      # redirect_to(:action => 'show', :resource_id => @resource.id)
      redirect_to resource_booking_path(@resource, @booking)
    else
      render 'new'
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def destroy
    @booking = Booking.find(params[:id]).destroy
    if @booking.destroy
      redirect_to resource_bookings_path(@resource, @booking)
    else
      render 'index'
    end
  end

  private
    
  def find_resource
    if params[:resource_id]
      @resource = Resource.find_by_id(params[:resource_id])
    end
  end


end
