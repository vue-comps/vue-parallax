// out: ..
<template lang="pug">
div(
  :style="computedStyle",
  style="position:relative; width: 100%; overflow: hidden;"
  )
  img(
    :src="src",
    ref="img",
    @load="processSrc",
    style="position:absolute;visibility:hidden"
    )
  slot(
    name="loading",
    v-if="!finished"
    )
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
    speed:
      type: Number
      default: 0.2

  computed:
    mergeStyle: ->
      height: @height+"px"
      backgroundImage: if @finished then "url('#{@src}')" else null
      backgroundPosition: "center " + Math.round( @position * 100 ) / 100 + 'px'
      backgroundSize: "auto " + @backgroundHeight*100 +"%"
    backgroundHeight: ->
      ratio = @imgRatio/@elRatio
      if ratio*@height >= @vpHeight
        return ratio
      else
        return @vpHeight/@height

    absoluteBackgroundHeight: -> @backgroundHeight*@imgHeight
    offset: ->
      offset = (@absoluteBackgroundHeight-@height)/2
      return offset

  data: ->
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
      @imgHeight = @$refs.img.clientHeight
      @imgRatio = @imgHeight / @$refs.img.clientWidth
      @processScroll()
    processScroll: ->
      rect = @$el.getBoundingClientRect()
      if rect.bottom > 0 and rect.top < @vpHeight # in viewport
        console.log rect.top
        @position = rect.top*(@speed-1) + @offset
        unless @finished
          @$nextTick => @$emit "loaded"
          @finished = true

  mounted: ->
    @onWindowScroll @processScroll
    @onWindowResize @processResize
    @$nextTick @processResize
</script>
