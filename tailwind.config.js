module.exports = {
  purge: [
    './app/**/*.html.erb',
    './app/**/*.html.slim',
    './app/**/*.json.jbuilder',
    './app/decorators/**/*.rb',
    './app/helpers/**/*.rb',
    './app/inputs/**/*.rb',
    './app/webpacks/**/*.js',
    './app/webpacks/**/*.vue',
    './app/webpacks/**/*.jsx',
    './config/initializers/**/*.rb',
    './lib/components/**/*.rb'
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {}
  },
  variants: {
    extend: {
      overflow: ['hover']
    }
  },
  plugins: [
    require('daisyui')
  ]
}
