<template lang="pug">
div
  .parallax-between(style="height:500px")
  parallax(src="http://materializecss.com/images/parallax1.jpg" ref="p",:style="style",:speed="speed")
    .loading(slot="loading") loading...
  .parallax-between(style="height:500px")
    span speed 0.8
    br
    a(href="https://github.com/vue-comps/vue-parallax/blob/master/dev/basic.vue") source
  parallax(src="http://materializecss.com/images/parallax2.jpg")
    .loading(slot="loading") loading...
  .parallax-between(style="height:500px")
    span speed 0.2
  .parallax-between(style="height:1000px")
</template>

<script lang="coffee">
module.exports =
  components:
    "parallax": require "../src/parallax.vue"
  data: ->
    speed: 0.8
    style: {}
</script>
