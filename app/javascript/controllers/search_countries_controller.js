import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-countries"
export default class extends Controller {
  static targets = ["popup"]

  connect() {
    console.log("Connected to search-countries controller")
  }

  searchCountries(e) {
    this.popupTarget.innerHTML = ''
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
            this.popupTarget.insertAdjacentHTML("beforeend", `<p>${country.name}</p>`)
          })
        });
    }, 800);
  }
}
