import { Controller } from "@hotwired/stimulus"
import Swiper from "swiper"
import { Navigation } from "swiper/modules"

export default class extends Controller {
  static targets = ["swiper"]

  connect() {
    this.slides = this.swiperTarget.querySelectorAll(".swiper-slide")
    this.currentIndex = 0
    this.showSlide(this.currentIndex)

    this.prevButton = this.element.querySelector(".custom-prev")
    this.nextButton = this.element.querySelector(".custom-next")
    this.prevButtonbottom =this.element.querySelector(".custom-prevbottom")
    this.nextButtonbottom =this.element.querySelector(".custom-nextbottom")

    this.prevButton.addEventListener("click", () => this.prevSlide())
    this.nextButton.addEventListener("click", () => this.nextSlide())
    this.prevButtonbottom.addEventListener("click", () => this.prevSlide())
    this.nextButtonbottom.addEventListener("click", () => this.nextSlide())
  }

  showSlide(index) {
    this.slides.forEach((slide, i) => {
      slide.classList.toggle("hidden", i !== index)
    })
  }

  nextSlide() {
    this.currentIndex = (this.currentIndex + 1) % this.slides.length
    this.showSlide(this.currentIndex)
  }

  prevSlide() {
    this.currentIndex =
      (this.currentIndex - 1 + this.slides.length) % this.slides.length
    this.showSlide(this.currentIndex)
  }
}
