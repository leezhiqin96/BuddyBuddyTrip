class CollaborationsController < ApplicationController
  def new
    @itinerary = Itinerary.find(params[:itinerary_id])
    @collaboration = Collaboration.new
    @collaboration.itinerary = @itinerary
    authorize @collaboration
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
