<template lang="jade">
parallax(src="http://materializecss.com/images/parallax1.jpg")
.parallax-between
  a(href="https://github.com/vue-comps/vue-parallax/blob/master/dev/basic.vue") source
parallax(src="http://materializecss.com/images/parallax2.jpg")
.parallax-between
.parallax-between
</template>

<script lang="coffee">
module.exports =
  components:
    "parallax": require "../src/parallax.vue"
</script>

<style lang="stylus">
.parallax-between
  height: 500px
  > a
    position relative
    left 250px
    top 40px
</style>
