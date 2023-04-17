class ItinerariesController < ApplicationController
  skip_before_action :authenticate_user!, only: :new

  def show
    @itinerary = Itinerary.find(params[:id])
    authorize @itinerary
  end

  def new
    @itinerary = Itinerary.new
    authorize @itinerary
  end

  def create
    @itinerary = Itinerary.new(itinerary_params)
    authorize @itinerary
    @itinerary.owner = current_user

    if @itinerary.save
      redirect_to itinerary_path(@itinerary)
    else
      render "itineraries/new", status: :unprocessable_entity
    end
  end

  private

  def itinerary_params
    params.require(:itinerary).permit(:name, :start_date, :end_date)
  end
end
