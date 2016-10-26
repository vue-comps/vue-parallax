env = null
p = null
scroll = (x,cb) ->
  window.scrollTo(0,x)
  window.requestAnimationFrame -> window.requestAnimationFrame cb

describe "parallax", ->

  describe "basic env", ->

    before ->
      env = loadComp(require("../dev/basic.vue"))
      p = env.$refs.p
      env.style = {width: "1000px"}
    after ->
      #unloadComp(env)

    it "should work", (done) ->
      @timeout(5000)
      p.$once "loaded", ->
        p.$el.should.have.attr("style").match /background-image: url/
        top = p.$el.getBoundingClientRect().top
        scroll top, ->
          p.$el.should.have.attr("style").match /background-position/
          style = p.$el.getAttribute("style")
          scroll 200+top, ->
            p.$el.should.have.attr("style").not.equal style
            style = p.$el.getAttribute("style")
            p.speed = 0
            scroll 400+top, ->
              p.$el.should.have.attr("style").not.equal style
              p.speed = 1
              done()
