import { Controller } from "@hotwired/stimulus"
// import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    coordinates: Object,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v12",
      center: [this.coordinatesValue.lng, this.coordinatesValue.lat],
      zoom: 12
    })

    this.#addMarkersToMap()
    this.#fitMapToMarkers()
    // this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
    //   mapboxgl: mapboxgl }))
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.destination_info)
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    bounds.extend([ this.coordinatesValue.lng, this.coordinatesValue.lat ])
    this.map.fitBounds(bounds, { padding: 90, maxZoom: 12, duration: 0 })
  }

  addTemporaryMarker(coordinates) {
    new mapboxgl.Marker({ color: "#FF0000" })
      .setLngLat(coordinates)
      .addTo(this.map);
  }
}
