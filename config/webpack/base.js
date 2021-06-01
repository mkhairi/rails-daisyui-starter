const { webpackConfig, merge } = require('@rails/webpacker')
const webpack = require('webpack')
// const CopyPlugin = require('copy-webpack-plugin')

process.env.NODE_ENV = process.env.NODE_ENV || 'production'
process.env.RELEASE_STAGE = process.env.RAILS_ENV || 'production'
process.env.BUILD_AT = JSON.stringify(process.env.BUILD_AT || Date.now())

// initialize additional plugins
const plugins = [
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Rails: ['@rails/ujs']
  }),
  new webpack.EnvironmentPlugin({
    BUILD_AT: process.env.BUILD_AT,
    NODE_ENV: process.env.NODE_ENV,
    ASSET_PATH: webpackConfig.output.publicPath
  })
]

const customConfig = {
  resolve: {
    alias: {
      jQuery: 'jquery/src/jquery'
    }
  },
  plugins: plugins
}

module.exports = merge(webpackConfig, customConfig)

// console.log(JSON.stringify(webpackConfig, undefined, 2))
