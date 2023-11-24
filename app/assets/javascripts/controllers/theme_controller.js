
import { Controller } from '@hotwired/stimulus'
export default class extends Controller {
  initialize () {
    this.apply()
  }

  connect () { }

  apply () {
    document.documentElement.setAttribute('data-theme', this.theme)
  }

  switch (event) {
    this.theme = event.target.dataset.themeValue
    console.log("switching" + this.theme)
    this.apply()
  }

  get systemDefault () {
    return window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light'
  }

  get theme () {
    return window.localStorage.getItem('theme') || (this.theme = this.systemDefault)
  }

  set theme (value) {
    window.localStorage.setItem('theme', value)
  }
}
