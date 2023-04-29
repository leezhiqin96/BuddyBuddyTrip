import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="destination"
export default class extends Controller {
  connect() {
  }

  deleteDestination(event) {
    event.preventDefault();
    const target = event.currentTarget
    if (confirm("Are you sure?")) {
      fetch(event.currentTarget.href, {
        method: "DELETE",
        accept: "application/json"
      })
        .then(response => response.json())
        .then(data => {
          const row = target.closest(".destination-details");
          row.parentElement.removeChild(row);
        });
    }
  }
}
