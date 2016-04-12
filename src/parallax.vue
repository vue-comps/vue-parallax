// out: ..
<template lang="jade">
div(
  v-bind:style="style"
  )
  img(v-bind:src="src" v-el:img @load="processSrc" style="position:absolute;visibility:hidden")
  slot
</template>

<script lang="coffee">
module.exports =

  mixins:[
    require("vue-mixins/onWindowScroll")
    require("vue-mixins/getDocumentHeight")
    require("vue-mixins/getViewportSize")
    require("vue-mixins/onWindowResize")
  ]

  props:
    "src":
      type: String
      required: true
    "height":
      type: Number
      default: 500
    "speed":
      type: Number
      default: 1

  data: ->
    viewportHeight: 0
    parallaxDistance: 0
    scrollDistance: 0
    ratio: 1
    style:
      position: "relative"
      width: "100%"
      overflow: "hidden"
      height: 0
      backgroundImage:"url('#{@src}')"
      backgroundSize: "100% auto"
      backgroundPositionY: 0
  watch:
    "height": "processHeight"
  methods:
    processResize: ->
      @viewportHeight = @getViewportSize().height
      @processSrc()
    processSrc: ->
      @ratio = @$els.img.clientHeight / @$els.img.clientWidth
      @processHeight()
    processHeight: ->
      if @height/@ratio > @$el.clientWidth # image smaller than box
        height = Math.floor(@$el.clientWidth*@ratio)
        @parallaxDistance = 0
      else
        height = @height
        @parallaxDistance = Math.floor(@$el.clientWidth*@ratio) - height
      @scrollDistance = @viewportHeight + height*2
      @style.height = height + "px"
      @$nextTick @processScroll
    processScroll: ->
      rect = @$el.getBoundingClientRect()
      if rect.bottom > 0 and rect.top < @viewportHeight # in viewport
        percentage = (@viewportHeight - rect.top) / (@scrollDistance)
        percentage = (1-@speed)/2+percentage*@speed
        @style.backgroundPositionY = Math.round( -@parallaxDistance * percentage ) + 'px'

  compiled: ->
    @onWindowScroll @processScroll
    @onWindowResize @processResize
    @viewportHeight = @getViewportSize().height
</script>
