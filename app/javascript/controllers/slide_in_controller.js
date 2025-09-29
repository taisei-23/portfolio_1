import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log("Slide-in connected!");

    requestAnimationFrame(() => {
      this.element.classList.remove('opacity-0', '-translate-x-10');
      this.element.classList.add('opacity-100', 'translate-x-0');
    });
  }
}
