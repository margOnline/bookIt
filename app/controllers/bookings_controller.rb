class BookingsController < ApplicationController
  respond_to :html, :xml, :json
  
  before_action :find_resource

  def index
    @bookings = Booking.where(resource_id: @resource.id)
    respond_with @bookings
  end

  def new
    @booking = Booking.new(resource_id: @resource.id)
  end

  def create
    @booking =  Booking.new(params[:booking].permit(:resource_id, :start_time, :length))
    @booking.resource = @resource
    # @booking.valid?
    if @booking.save
      redirect_to resource_bookings_path(@resource, method: :get)
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
      flash[:notice] = "Booking: #{@booking.start_time.strftime('%e %b %Y %H:%M%p')} to #{@booking.end_time.strftime('%e %b %Y %H:%M%p')} deleted"
      redirect_to resource_bookings_path(@resource)
    else
      render 'index'
    end
  end

  private

  def save booking
    if @booking.save
        flash[:notice] = 'booking added'
        redirect_to resource_booking_path(@resource, @booking)
      else
        render 'new'
      end
  end

  def find_resource
    if params[:resource_id]
      @resource = Resource.find_by_id(params[:resource_id])
    end
  end


end
