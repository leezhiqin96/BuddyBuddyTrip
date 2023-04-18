import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-countries"
export default class extends Controller {
  static targets = ["popup", "input"]

  connect() {
    console.log("Connected to search-countries controller")
    document.addEventListener("click", this.handleDocumentClick.bind(this));
  }

  disconnect() {
    // Remove the click listener from the document object when the controller is disconnected
    document.removeEventListener("click", this.handleDocumentClick)
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
            `<div class="country" data-action="click->search-countries#selectResult">
              ${country.name}
            </div>`
            )
          })
        });
    }, 800);
  }

  showResult() {
    this.popupTarget.classList.add('active');
  }

  hideResult() {
    this.popupTarget.classList.remove('active');
  }

  selectResult(e) {
    const selectedCountryName = e.target.innerText;
    this.inputTarget.value = selectedCountryName;
    this.hideResult();
  }

  handleDocumentClick(e) {
    const target = e.target
    const popup = this.popupTarget

    // Check if the click event is not within the popup element or the input element
    if (popup && !popup.contains(target) && target !== popup && target !== this.inputTarget) {
      this.hideResult()
    }
  }
}
