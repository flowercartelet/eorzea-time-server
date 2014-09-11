((global)->
  'use strict'

  global.EorzeaTime = global.EorzeaTime || {}

  class EorzeaDate
    constructor: ->
      @baseDate = new Date()
      @date = @_computeEorzeaTime()

    getHours: ->
      @date.getUTCHours()

    getMinutes: ->
      @date.getUTCMinutes()

    getSeconds: ->
      @date.getUTCSeconds()

    # private

    _computeEorzeaTime: ->
      newDate = new Date()
      time = @baseDate.getTime()
      time = Math.floor(time * 1440 / 70)
      newDate.setTime(time)
      newDate

  EorzeaTime.Date = EorzeaDate
)(this)
