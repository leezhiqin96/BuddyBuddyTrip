import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-countries"
export default class extends Controller {
  connect() {
    console.log("Connected to search-countries controller")
  }

  searchCountries(e) {
    clearTimeout(this.timer);

    this.timer = setTimeout(() => {
      const url = `/search_countries?query=${e.target.value}`;

      fetch(url, {
        headers: {
          Accept: "application/json",
        },
      })
        .then((res) => res.json())
        .then((data) => {
          // this.listTarget.outerHTML = data;
          data.forEach((country) => {
            console.log(country.name)
          })
        });
    }, 800);
  }
}
