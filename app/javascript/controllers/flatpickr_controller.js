import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
// Connects to data-controller="flatpickr"
export default class extends Controller {
  static values = {start:String, end:String}
  connect() {
    console.log(this.startValue)
    console.log("hello from the Flatpickr controller")
    new flatpickr(this.element, {
      // more options available on the documentation!
      altInput: true,
      enable: [
        {
           from: this.startValue,
           to: this.endValue
       }
    ]
    });
  }
}
