import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// Connects to data-controller="address-autocomplete"
export default class extends Controller {
  static values = { apiKey: String }

  static targets = ["address"]

  connect() {
    this.geocoder = new MapboxGeocoder({
      accessToken: this.apiKeyValue,
      types: "country,region,place,postcode,locality,neighborhood,address"
    })
    this.geocoder.addTo(this.element)

    this.geocoder.on("result", event => this.#setInputValue(event))
    this.geocoder.on("clear", () => this.#clearInputValue())
  }

  disconnect() {
    this.geocoder.onRemove()
  }

  #setInputValue(event) {
    // set place name in form
    this.addressTarget.value = event.result["place_name"]

    const coordinates = event.result["geometry"]["coordinates"]

    // formData to send to AJAX
    const formData = new FormData(this.element.parentElement);
    formData.set("destination[name]",  event.result["text"])
    formData.set("destination[latitude]", coordinates[1])
    formData.set("destination[longitude]",  coordinates[0])

    // After setting input value, create new Destination instance
    fetch(this.element.parentElement.action, {
      method: "POST",
      headers: {
        Accept: "application/json"
      },
      body: formData
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
      })
  }

  #clearInputValue() {
    this.addressTarget.value = ""
  }
}