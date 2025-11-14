import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "results"]

  timeout = null

  search() {
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      let query = this.inputTarget.value.trim()

      fetch(`/posts/autocomplete?q=${encodeURIComponent(query)}`)
        .then(res => res.json())
        .then(data => {
          this.resultsTarget.innerHTML = data.map(p => `
            <li class="p-2 hover:bg-gray-100 cursor-pointer"
                data-action="click->autocomplete#select"
                data-value="${p.title}">
              ${p.title}
            </li>
          `).join("")
        })
    }, 300)
  }

  select(event) {
    const value = event.currentTarget.dataset.value
    this.inputTarget.value = value
    this.resultsTarget.innerHTML = ""
  }

  connect() {
    console.log("Autocomplete connected!")
  }
}