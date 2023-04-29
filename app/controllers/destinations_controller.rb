class DestinationsController < ApplicationController
  def create
    skip_authorization

    @destination = Destination.new(destinations_params)
    @itinerary = Itinerary.find(params[:itinerary_id])

    coordinates = [destinations_params[:latitude], destinations_params[:longitude]]
    @destination.assign_destination_to_country(coordinates)

    respond_to do |format|
      if @destination.save
        # Assign destination to a certain date
        @destination.assign_destination_to_date(params[:destination][:storage_date_id])
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
