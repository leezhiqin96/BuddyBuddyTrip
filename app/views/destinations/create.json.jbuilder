if @destination.persisted?
  json.form render(
    partial: "destinations/new_destination_form",
    formats: :html,
    locals: {
      itinerary: @itinerary,
      destination: Destination.new
    }
  )

  json.inserted_item render(
    partial: "destinations/new_destination",
    formats: :html,
    locals: { destination: @destination }
  )
else
  json.form render('itineraries/edit')
end
