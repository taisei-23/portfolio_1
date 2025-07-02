// app/javascript/controllers/mountain_sidebar_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["panel", "carForm"]

  connect() {
    console.log("✅ mountain-sidebar connected")

    if (this.element.dataset.show === "true") {
      this.panelTarget.classList.remove("hidden")
    }
  }

  selectCar() {
    console.log("🚗 車が選ばれました")
    if (this.hasCarFormTarget) {
      this.carFormTarget.classList.remove("hidden")
    }
  }

  selectTrain() {
    console.log("🚆 電車が選ばれました")
    if (this.hasCarFormTarget) {
      this.carFormTarget.classList.add("hidden")
    }
  }
}
