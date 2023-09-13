import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flatpickr"
export default class extends Controller {
  connect() {
    new flatpickr(this.element, {
      // more options available on the documentation!
    });
  //   enable: [
  //     {
  //         from: `${ @plan.start_date}`,
  //         to: `${ @plan.end_date}`
  //     }
  // ]
  }


}
