module.exports = {
  mode: 'jit',
  purge: {
    content: [
      './app/**/*.html.erb',
      './app/**/*.html.slim',
      './app/**/*.json.jbuilder',
      './app/decorators/**/*.rb',
      './app/helpers/**/*.rb',
      './app/inputs/**/*.rb',
      './app/packs/**/*.js',
      './app/packs/**/*.vue',
      './app/packs/**/*.jsx',
      './config/initializers/**/*.rb',
      './lib/components/**/*.rb'
    ],
    options: {
      safelist: [
        /data-theme$/
      ]
    }
  },
  plugins: [
    require('@tailwindcss/typography'),
    require('daisyui')
  ]
}
