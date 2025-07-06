// app/javascript/controllers/mountain_sidebar_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["panel"]

  connect() {
    console.log("✅ mountain-sidebar connected")

    if (this.element.dataset.show === "true") {
      this.panelTarget.classList.remove("hidden")
    }
  }

  selectCar() {
    console.log("🚗 車が選ばれました")
  }

  selectTrain() {
    console.log("🚆 電車が選ばれました")
  }
}
