if @destination.persisted?
  json.form render(
    partial: "itineraries/new_destination_form",
    formats: :html,
    locals: {
      itinerary: @itinerary,
      destination: Destination.new
    }
  )
end
