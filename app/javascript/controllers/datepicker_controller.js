import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
import rangePlugin from "flatpickrRangePlugin";

export default class extends Controller {
  connect() {
    flatpickr(this.element, {
    // mode: "range",
    // minDate: "today",
    // dateFormat: "Y-m-d"
     altInput: true,
     plugins: [new rangePlugin({ input: "#end_date"})]
    })
  }
}
