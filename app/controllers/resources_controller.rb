class ResourcesController < ApplicationController

  def index
    @resources = Resource.all
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.create(resource_params)
    if @resource.save
      name = @resource.name
      redirect_to resources_path
      flash[:notice] = "#{name} created"
    else
      render 'new'
      flash[:error] = "Unable to create resource. Please try again"
    end
  end

  private

    def resource_params
      params.require(:resource).permit(:name)
    end


end
