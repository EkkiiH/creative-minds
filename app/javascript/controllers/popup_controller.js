import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="popup"
export default class extends Controller {
  connect() {
  console.log("hello")
  }
create(event){
  event.preventDefault()
  const confirmation = confirm('Do you want to add a task for this plan?');
  if (confirmation) {
    const form = new FormData(this.element)
    form.append("new_task", "true")
    form.submit()
  } else {
    // Submit the plan form
    this.submit();
  }
 console.log("hi")
}
}
