# vue-parallax

Scrolls a image slower than the window to create a neat optical effect.

### [Demo](https://vue-comps.github.io/vue-parallax)


# Install

```sh
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
speed | Number | 0.2 | 0.0 means the image will appear fixed in place, and 1.0 the image will flow at the same speed as the page content.

#### Events
Name |  description
---:| --- | ---| ---
image-loaded |  will be called when the image is loaded
loaded |  will be called when the first calculation - after a image is loaded - is finished

## Changelog
- 1.1.1  
bugfix in portrait mode  

- 1.1.0  
changed way the picture moves, now in line with other parallax implementations  
now working on devices in portrait mode  

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
