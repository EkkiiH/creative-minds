import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="popup"
export default class extends Controller {
  static targets=["hiddenField"]
  connect() {
  }
create(event){
  event.preventDefault()
  const confirmation = confirm('Do you want to add a task for this plan?');
  if (confirmation) {
    this.hiddenFieldTarget.value = "true";
    this.element.submit();
  } else {
    // Submit the plan form
    this.element.submit();
  }
}
}
