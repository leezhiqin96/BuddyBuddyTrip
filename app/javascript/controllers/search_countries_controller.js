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
      // this.popupTarget.classList.add('active')
      const url = `/search_countries?query=${e.target.value}`;

      fetch(url, {
        headers: {
          Accept: "application/json",
        },
      })
      .then((res) => res.json())
      .then((data) => {
          this.popupTarget.innerHTML = ''
          data.forEach((country) => {
            this.popupTarget.insertAdjacentHTML("beforeend", `<p>${country.name}</p>`)
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
}
