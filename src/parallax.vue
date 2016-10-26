// out: ..
<template lang="pug">
div(
  v-bind:style="computedStyle"
  style="position:relative; width: 100%; overflow: hidden"
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
      default: 0.2
      coerce: Number

  computed:
    mergeStyle: ->
      height: @height+"px"
      backgroundImage: if @finished then "url('#{@src}')" else null
      backgroundPosition: "center " + Math.round( @position * 100 ) / 100 + 'px'
      backgroundSize: "auto " + @backgroundHeight*100 +"%"
    backgroundHeight: ->
      ratio = @imgRatio/@elRatio
      if ratio*@height >= @vpHeight
        @offset = (ratio*@imgHeight-@height)/2
        return ratio
      else
        @offset = 0
        return @vpHeight/@height


  data: ->
    offset: 0
    vpHeight: 0
    imgRatio: 1
    elRatio: 1
    vpRatio: 1
    imgHeight: 0
    finished: false
    position: 0

  methods:
    processResize: (e) ->
      vpsize = @getViewportSize()
      @vpRatio = vpsize.height / vpsize.width
      @vpHeight = vpsize.height
      @elRatio = @height / @$el.clientWidth
      @processScroll() if e?
    processSrc: ->
      @$emit "image-loaded"
      @finished = false
      @imgHeight = @$els.img.clientHeight
      @imgRatio = @imgHeight / @$els.img.clientWidth
      @processScroll()
    processScroll: ->
      rect = @$el.getBoundingClientRect()
      if rect.bottom > 0 and rect.top < @vpHeight # in viewport
        @position = rect.top*(@speed-1) + @offset
        unless @finished
          @$nextTick => @$emit "loaded"
          @finished = true

  compiled: ->
    @onWindowScroll @processScroll
    @onWindowResize @processResize
  ready: ->
    @processResize()
</script>
