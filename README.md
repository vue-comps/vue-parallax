# vue-parallax

Scrolls a image slower than the window to create a neat optical effect.

### [Demo](https://vue-comps.github.io/vue-parallax)


# Install

```sh
npm install --save-dev vue-parallax
```
or include `build/bundle.js`.

## Usage
```coffee
# in your component
components:
  "parallax": require("vue-parallax")
# or, when using bundle.js
components:
  "parallax": window.vueComps.parallax
```
```html
<parallax src="path/to/img">
</parallax>
```

For examples see [`dev/`](dev/).

#### Props
| Name | type | default | description |
| ---:| --- | ---| --- |
| src | String | - | (required) path to image |
| height | Number | 500 | height of the parallax element |
| speed | Number | 0.8 | 0 doesn't scroll the image, 1 scrolls through the whole image  |


# Development
Clone repository.
```sh
npm install
npm run dev
```
Browse to `http://localhost:8080/`.

## License
Copyright (c) 2016 Paul Pflugradt
Licensed under the MIT license.
