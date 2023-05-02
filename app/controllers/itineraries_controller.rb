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

    # Create new Collaboration, where current user will be the owner
    collaboration = Collaboration.new(user: current_user, itinerary: @itinerary, role: 'editor')

    if @itinerary.save && collaboration.save
      # Takes user stated start and end date and save it under StorageDate
      @itinerary.store_dates
      redirect_to edit_itinerary_path(@itinerary)
    else
      render "itineraries/new", status: :unprocessable_entity
    end
  end

  def edit
    @itinerary = Itinerary.includes(:collaborations, storage_dates: [:destinations]).find(params[:id])
    authorize @itinerary

    # For mapbox to center to the itinerary's stated country
    # Subject to changes if itineraries were to have multiple countries
    country = @itinerary.countries.first
    @coordinates = {
      lat: country.latitude,
      lng: country.longitude
    }

    # Address autocomplete search bar
    @destination = Destination.new

    # Sending coordinates of each destination as @markers
    @destinations = @itinerary.destinations
    @markers = @destinations.geocoded.map do |destination|
      {
        lat: destination.latitude,
        lng: destination.longitude,
        destination_info: render_to_string(partial: "destinations/destination_info", locals: { destination: })
      }
    end
  end

  def destroy
    @itinerary = Itinerary.find(params[:id])
    authorize @itinerary
    @itinerary.destroy

    redirect_to authenticated_root_path
  end

  private

  def itinerary_params
    params.require(:itinerary).permit(:name, :start_date, :end_date)
  end
end
