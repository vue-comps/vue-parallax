# vue-parallax

Scrolls a image slower than the window to create a neat optical effect.

### [Demo](https://vue-comps.github.io/vue-parallax)


# Install

```sh
npm install --save-dev vue-parallax
// vue@1.0
npm install --save-dev vue-parallax@1
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
  <div slot="loading">loading...</div>
  <div>content</div>
</parallax>
```
content will be shown after loading

For examples see [`dev/`](dev/).

#### Webpack
If your assets are organized by webpack, this should work:
```html
<parallax src=require('../assets/your-image.jpg')></parallax>
```

#### Props
Name | type | default | description
---:| --- | ---| ---
src | String | - | (required) path to image
height | Number | 500 | height of the parallax element
speed | Number | 1 | 0 doesn't scroll the image, 1 scrolls through the whole image

#### Events
Name |  description
---:| --- | ---| ---
image-loaded |  will be called when the image is loaded
loaded |  will be called when the first calculation - after a image is loaded - is finished

## Changelog
- 2.0.0  
now compatible with vue 2.0.0  

- 1.0.0  
some cleaning  
added unit tests  
now working with firefox  

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
