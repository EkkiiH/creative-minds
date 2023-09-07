import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tasks"
export default class extends Controller {
  connect() {
    console.log("Hello from tasks_controller.js")
  }
  // static targets = ["markedElement"]
  // fire() {
  //   this.markedElementTarget.classList.toggle("done");
  // }
}
