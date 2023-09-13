import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
// Connects to data-controller="flatpickr-special"
export default class extends Controller {
  connect() {
    new flatpickr(this.element, {
      altInput: true
      // more options available on the documentation!
    });
  }
}
