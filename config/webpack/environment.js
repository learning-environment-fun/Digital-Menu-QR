const { environment } = require('@rails/webpacker')

const webpack = require('webpack')


/*const sassLoader = {
  test: /\.scss$/,
  use: 'sass-loader', options: {
    implementation: require("sass")
  }
}

// Insert json loader at the top of list
environment.loaders.prepend('sass', sassLoader);*/
/*
const sassLoaderIndex = environment.loaders
  .get("sass")
  .use.findIndex(el => el.loader === "sass-loader")

let sassLoader = environment.loaders.get("sass").use[sassLoaderIndex]

sassLoader = {
  ...sassLoader,
  options: {
    ...sassLoader.options,
    includePaths: ["./node_modules"],
  },
}

environment.loaders.get("sass").use[sassLoaderIndex] = sassLoader
*/
// Preventing Babel from transpiling NodeModules packages
environment.loaders.delete('nodeModules');

// Bootstrap 4 has a dependency over jQuery & Popper.js:
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
  })
)

module.exports = environment
