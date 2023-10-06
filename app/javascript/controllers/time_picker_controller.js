import { Controller } from "@hotwired/stimulus"
import timepickr from "timepickr";

// Connects to data-controller="time-picker"
export default class extends Controller {
  connect() {
    timepickr(this.element)
  }
}
