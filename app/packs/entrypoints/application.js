/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/packs and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
import 'core-js/stable'
import 'regenerator-runtime/runtime'

import * as ActiveStorage from '@rails/activestorage'
import * as Turbo from '@hotwired/turbo'
import 'javascripts'

const images = require.context('../images', true)
const imagePath = (name) => images(name, true)

window.App || (window.App = {})
window.jQuery = $
window.$ = $

require('trix')
require('@rails/actiontext')

// Rails.start()
ActiveStorage.start()
console.log('Hello World from Webpacker')
