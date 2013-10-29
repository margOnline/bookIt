class BookingsController < ApplicationController

   before_action :find_resource

  def index
    @bookings = Booking.all.where(resource_id: @resource.id)
  end

  def new
    @booking = Booking.new(resource_id: @resource.id)
  end

  def create
    @booking = Booking.new(params[:booking].permit(:resource_id, :post, :rating))
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


end
