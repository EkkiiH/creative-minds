import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="progress-bar"
export default class extends Controller {
  static targets=["circle", "progress"]
  static values={
    plans:Number,
    completedplans:Number
  }
  connect() {
    console.log(this)
    const percentage = (this.completedplansValue/this.plansValue)*100
    this.circleTarget.innerHTML = percentage
    this.circleTarget.value = percentage
    this.progressTarget.style.background = `radial-gradient(closest-side, white 79%, transparent 80% 100%),conic-gradient(#0ac6fa ${percentage}%, #92fa9c 0)`
    this.progressTarget.setAttribute("percentage", `${percentage}%`)
  }
}
