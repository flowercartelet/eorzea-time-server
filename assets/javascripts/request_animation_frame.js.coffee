((global)->
  'use strict'

  requestAnimationFrame =
    global.requestAnimationFrame ||
    global.webkitRequestAnimationFrame ||
    global.mozRequestAnimationFrame ||
    (callback)->
      return setTimeout(callback, 1000 / 60)

  global.requestAnimationFrame = requestAnimationFrame
)(this)