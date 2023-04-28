class DestinationsController < ApplicationController
  def create
    skip_authorization

    @destination = Destination.new(destinations_params)
    @itinerary = Itinerary.find(params[:itinerary_id])

    coordinates = [destinations_params[:latitude], destinations_params[:longitude]]
    country = Country.find(Geocoder.search(coordinates).first.country_code.upcase)

    @destination.country = country

    respond_to do |format|
      if @destination.save
        StorageDateDestination.create!(
          storage_date: StorageDate.find(params[:destination][:storage_date]),
          destination: @destination
        )
        @itinerary.destinations << @destination
        format.html { redirect_to edit_itinerary_path(@itinerary) }
      else
        format.html { render edit_itinerary_path(@itinerary), status: :unprocessable_entity }
      end
      format.json
    end
  end

  private

  def destinations_params
    params.require(:destination).permit(:name, :address, :latitude, :longitude)
  end
end
