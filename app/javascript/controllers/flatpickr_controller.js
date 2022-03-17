import { Controller } from "@hotwired/stimulus";
import Flatpickr from "stimulus-flatpickr";
//import Rails from "rails-ujs";
import "flatpickr/dist/themes/dark.css";

export default class extends Flatpickr {
  connect() {
    //global options
    this.config = {
      ...this.config, //spread options in case some where defined in initialize
      enableTime: true,
      minTime: "09:00",
      dateFormat: "d-m-Y H:i",
    };
    super.connect();
  }

  change(selectedDates, dateStr, instance) {
    const form = this.element.closest("form");
    Rails.fire(form, "submit");
  }

}
