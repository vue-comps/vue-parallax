// out: ..
<template lang="pug">
div(
  v-bind:style="computedStyle"
  style="position:relative; width: 100%; overflow: hidden;background-size: 100% auto"
  )
  img(v-bind:src="src" v-el:img @load="processSrc" style="position:absolute;visibility:hidden")
  slot(name="loading" v-if="!finished")
  slot(v-if="finished")
</template>

<script lang="coffee">
module.exports =
  mixins:[
    require("vue-mixins/onWindowScroll")
    require("vue-mixins/getDocumentHeight")
    require("vue-mixins/getViewportSize")
    require("vue-mixins/onWindowResize")
    require("vue-mixins/style")
  ]

  props:
    style:
      default: -> []
    src:
      type: String
      required: true
    height:
      type: Number
      default: 500
      coerce: Number
    speed:
      type: Number
      default: 1
      coerce: Number

  computed:
    mergeStyle: ->
      height: @cHeight+"px"
      backgroundImage: if @finished then "url('#{@src}')" else null
      backgroundPosition: "0 " + Math.round( -@parallaxDistance * @percentage ) + 'px'
    scrollDistance: -> @viewportHeight + @cHeight * 2
    cHeight: ->
      width = @$el.clientWidth
      if @height/@ratio > width # image smaller than box
        @parallaxDistance = 0
        return Math.floor(width*@ratio)
      else
        @parallaxDistance = Math.floor(width*@ratio) - @height
        return @height

  data: ->
    viewportHeight: 0
    parallaxDistance: 0
    percentage: 0
    ratio: 1
    finished: false

  methods:
    processResize: ->
      @viewportHeight = @getViewportSize().height
      @processSrc()
    processSrc: ->
      @$emit "image-loaded"
      @finished = false
      @ratio = @$els.img.clientHeight / @$els.img.clientWidth
      @processScroll()
    processScroll: ->
      rect = @$el.getBoundingClientRect()
      if rect.bottom > 0 and rect.top < @viewportHeight # in viewport
        @percentage = (@viewportHeight - rect.top) / (@scrollDistance)
        @percentage = (1-@speed)/2+@percentage*@speed
        unless @finished
          @$nextTick => @$emit "loaded"
          @finished = true

  compiled: ->
    @onWindowScroll @processScroll
    @onWindowResize @processResize
    @viewportHeight = @getViewportSize().height
</script>
