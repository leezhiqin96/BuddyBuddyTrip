import { Controller } from "@hotwired/stimulus"

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
      zoom: 9
    })

    // this.#fitMapToMarkers()
  }

  // #fitMapToMarkers() {
  //   const bounds = new mapboxgl.LngLatBounds()
  //   bounds.extend([ this.coordinatesValue.lng, this.coordinatesValue.lat ])
  //   this.map.fitBounds(bounds, { padding: 200, maxZoom: 15, duration: 0 })
  // }
}
