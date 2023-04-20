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
    @itinerary.name = "Trip to #{itinerary_params[:name]}"

    # Subject to changes (To include multiple countries in the future)
    country = Country.find_by(name: itinerary_params[:name])
    @itinerary.countries << country unless country.nil?
    collaboration = Collaboration.new(user: current_user, itinerary: @itinerary, role: 'editor')

    if @itinerary.save && collaboration.save
      redirect_to edit_itinerary_path(@itinerary)
    else
      render "itineraries/new", status: :unprocessable_entity
    end
  end

  def edit
    @itinerary = Itinerary.find(params[:id])
    authorize @itinerary
  end

  private

  def itinerary_params
    params.require(:itinerary).permit(:name, :start_date, :end_date)
  end
end
