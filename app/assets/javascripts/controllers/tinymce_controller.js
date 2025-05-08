import tinymce from 'tinymce/tinymce'

import { Controller } from '@hotwired/stimulus'
export default class extends Controller {
  static targets = ['input']

  initialize() {
    this.defaults = {
      license_key: 'gpl', // Your license key
      base_url: '/assets/tinymce',
      plugins:
        'preview importcss autolink autosave save directionality code visualblocks visualchars fullscreen image link media table charmap pagebreak nonbreaking anchor advlist lists help charmap quickbars',
      menubar: 'file edit view insert format tools table',
      toolbar:
        'undo redo | bold italic underline strikethrough | fontselect fontsizeselect formatselect | alignleft aligncenter alignright alignjustify | outdent indent |  numlist bullist preview | forecolor backcolor removeformat | pagebreak | charmap | insertfile image media link anchor | ltr rtl fullscreen',
      toolbar_sticky: true,
      images_upload_url: '/image_uploader/image',
      file_picker_types: 'file image media',
      suffix: '.min',
      relative_urls: false,
      //skin: (window.matchMedia('(prefers-color-scheme: dark)').matches ? 'oxide-dark' : 'oxide'),
      //content_css: (window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'default')
      setup: (editor) => {
        editor.on('init', () => {
          // Set the initial background color root variable
          // get document --color-base-100
          const root = document.documentElement
          const background = getComputedStyle(root).getPropertyValue('--color-base-100')
          const color = getComputedStyle(root).getPropertyValue('--color-base-content')
          editor.getDoc().body.style.backgroundColor = background
          editor.getDoc().body.style.color = color
        })
      }
    }
  }

  connect() {
    // Initialize the app
    let config = Object.assign({ target: this.inputTarget }, this.defaults)
    tinymce.init(config)
    this.listener()
  }

  disconnect() {
    tinymce.remove()
  }

  listener() {
    document.body.addEventListener('click', e => {
      if (e.target.name === 'commit') {
        tinyMCE.triggerSave()
      }
    })
  }
}
