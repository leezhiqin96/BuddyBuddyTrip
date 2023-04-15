class ItinerariesController < ApplicationController
  skip_before_action :authenticate_user!, only: :new

  def new
    @itinerary = Itinerary.new
    authorize @itinerary
  end

  def create
    @itinerary = Itinerary.new(itinerary_params)
    authorize @itinerary
  end

  private

  def itinerary_params
    params.require(:itinerary).permit(:name, :start_date, :end_date)
  end
end
