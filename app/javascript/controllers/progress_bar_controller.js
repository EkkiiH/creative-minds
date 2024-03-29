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
    this.progressTarget.style.background = `radial-gradient(closest-side, white 69%, transparent 70%, rgba(0,0,0,0.05) 70%, transparent 78%),conic-gradient(#03A9F4, #AB47BC, #F59652 ${percentage}%, #EEF0F3 ${percentage + 6 }%)`
    this.progressTarget.setAttribute("percentage", `${percentage}%`)
  }

  toggleTodo() {
    console.log(this.completedplansValue)
    console.log(this.plansValue)
  }
}
