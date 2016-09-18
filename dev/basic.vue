<template lang="pug">
parallax(src="http://materializecss.com/images/parallax1.jpg" v-ref:p,:style="style")
  .loading(slot="loading") loading...
.parallax-between(style="height:500px")
  br
  a(href="https://github.com/vue-comps/vue-parallax/blob/master/dev/basic.vue") source
parallax(src="http://materializecss.com/images/parallax2.jpg")
  .loading(slot="loading") loading...
.parallax-between(style="height:500px")
.parallax-between(style="height:500px")
</template>

<script lang="coffee">
module.exports =
  components:
    "parallax": require "../src/parallax.vue"
  data: ->
    style: {}
</script>
