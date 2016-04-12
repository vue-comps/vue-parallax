webpack = require "webpack"

module.exports =
  entry: "./build/common.coffee"
  output:
    filename: "bundle.js"
    path: __dirname
  module:
    loaders: [
      { test: /\.coffee$/, loader: "coffee"}
    ]
  plugins: [
    new webpack.optimize.UglifyJsPlugin compress: warnings: false
    new webpack.optimize.OccurenceOrderPlugin()
  ]
