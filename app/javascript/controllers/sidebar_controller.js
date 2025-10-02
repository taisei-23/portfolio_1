import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["sidebar"]

  toggle() {
    console.log("Sidebar toggle triggered")
    this.sidebarTarget.classList.toggle("-translate-x-full")
    console.log("Sidebar classes:", this.sidebarTarget.classList)
  }
}
