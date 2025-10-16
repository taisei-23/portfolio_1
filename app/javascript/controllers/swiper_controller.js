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
      if (i === index) {
        slide.classList.remove("hidden", "opacity-0", "translate-y-5")
        slide.classList.add("transition-all", "duration-700", "ease-out", "opacity-100", "translate-y-0")
      } else {
        slide.classList.add("opacity-0", "translate-y-5")
        setTimeout(() => slide.classList.add("hidden"), 300)
      }
    })
  }
  
  nextSlide() {
    this.currentIndex = (this.currentIndex + 1) % this.slides.length
    this.showSlide(this.currentIndex, "next")
  }

  prevSlide() {
    this.currentIndex =
      (this.currentIndex - 1 + this.slides.length) % this.slides.length
    this.showSlide(this.currentIndex, "prev")
  }
}
