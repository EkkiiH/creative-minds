import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tasks"
export default class extends Controller {
  connect() {
    console.log("Hello from tasks_controller.js")
  }
  fire() {
    const meta = document.querySelector("meta[name=csrf-token]").content
    console.log(meta);
    fetch(`/tasks/${this.element.dataset.id}/toggle_complete`,
    {method: "patch",
    headers: {"Content-Type": "text/plain", 'X-CSRF-Token': meta }
    })
    .then(response => response.text())
    .then((data) => {
      console.log(data)
    })

    // this.ElementTarget.classList.toggle("done");
  }
}
