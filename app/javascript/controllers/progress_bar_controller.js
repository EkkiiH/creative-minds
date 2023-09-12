import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="progress-bar"
export default class extends Controller {
  static targets=["circle", "progress"]
  static values={
    plans: Number,
    completedplans: Number
  }
  connect() {
    const percentage =  Math.ceil((this.completedplansValue/this.plansValue)*100)
    this.circleTarget.innerHTML = percentage
    this.circleTarget.value = percentage
    this.progressTarget.style.background = `radial-gradient(closest-side, white 79%, transparent 80% 100%),conic-gradient(#03A9F4, #AB47BC, #F59652 ${percentage}%, #BBB 0)`
    this.progressTarget.setAttribute("percentage", `${percentage}%`)
  }

  toggleTodo() {
    console.log(this.completedplansValue)
    console.log(this.plansValue)
  }
}
