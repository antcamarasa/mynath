// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"



Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "controllers"
import "bootstrap"

// ./packs/application.js
import { Application } from 'stimulus'
import { definitionsFromContext } from 'stimulus/webpack-helpers'
import  twilioInit  from '../plugins/twilio.js';

const application = Application.start()
const context = require.context('../controllers', true, /\.js$/)
application.load(definitionsFromContext(context))

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  //toggler()
  if (document.querySelector('.twilio-video')) {
    twilioInit();
  }
});
