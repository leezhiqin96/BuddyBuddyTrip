if @destination.persisted?
  json.form render(
    partial: "itineraries/new_destination_form",
    formats: :html,
    locals: {
      itinerary: @itinerary,
      destination: Destination.new
    }
  )

  json.inserted_item render(
    partial: "itineraries/new_destination",
    formats: :html
  )
else
  json.form render('itineraries/edit')
end
