import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-countries"
export default class extends Controller {
  static targets = ["popup"]

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
          this.popupTarget.innerHTML = ''

          if (data.length == 0) {
            this.popupTarget.innerHTML = 'No results'
          }

          data.forEach((country) => {
            this.popupTarget.insertAdjacentHTML("beforeend",
              `<div class="country"
                data-action="click->search-countries#selectResult"
              >
                ${country.name}
              </div>`
            )
          })
        });
    }, 800);
  }

  showResult() {
    this.popupTarget.classList.add('active')
  }

  hideResult() {
    this.popupTarget.classList.remove('active')
  }

  selectResult() {

  }
}
