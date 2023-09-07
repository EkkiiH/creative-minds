import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="togglenavbar"
export default class extends Controller {
  static targets = ["navbar"]
  connect() {
    console.log('test');
  }
  toggleNav() {
    console.log('hello');
    this.navbarTarget.classList.toggle("inactive");
  }
}

// $(document).ready(function () {
//   $('#sidebarCollapse').on('click', function () {
//       $('#sidebar').toggleClass('active');
//   });
// });

// function openNav() {
// document.getElementById("sidebar").style.width = "250px";
// document.getElementById("main").style.marginLeft = "250px";
// }

// function closeNav() {
// document.getElementById("sidebar").style.width = "0";
// document.getElementById("main").style.marginLeft= "0";
// }
