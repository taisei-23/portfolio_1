import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="train-search"
export default class extends Controller {
  static targets = ["from", "to", "result"]

  search(event) {
    event.preventDefault()

    const from = this.fromTarget.value
    const to = this.toTarget.value

    if (!from || !to) return

    const url = `/train_route_sidebar?from=${encodeURIComponent(from)}&to=${encodeURIComponent(to)}`

    fetch(url, {
      headers: { "Accept": "text/vnd.turbo-stream.html" }
    })
      .then(response => response.text())
      .then(html => {
        this.resultTarget.innerHTML = html
      })
      .catch(error => {
        console.error("🚨 Fetch error:", error)
        this.resultTarget.innerHTML = "<p class='text-red-600'>エラーが発生しました。</p>"
      })
  }
}