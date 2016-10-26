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

#### Module build failed: SyntaxError: 'with' in strict mode
Currently [buble](https://gitlab.com/Rich-Harris/buble) is injecting `strict` mode in all processed js files. The down to ES5 compiled component contains `with`, which is forbidden in `strict` mode.
Buble is used, for example, in rollup, which is used in laravel.

If you are running in this problem, make sure to exclude this component from processing with buble.

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
- 2.1.2  
now working on devices in portrait mode

- 2.1.1  
bugfix  

- 2.1.0  
changed way the picture moves, now in line with other parallax implementations  

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
