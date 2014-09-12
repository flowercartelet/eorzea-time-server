#= require jquery
#= require bootstrap
#= require eorzea_time

(($)->
  'use strict';

  do setTime = ->
    if (eorzeaClock = $('#eorzea .time')).length > 0
      eorzeaDate = new EorzeaTime.Date()
      eorzeaClock.attr('data-hours', eorzeaDate.getHours())
      eorzeaClock.attr('data-minutes', eorzeaDate.getMinutes())
      eorzeaClock.attr('data-seconds', eorzeaDate.getSeconds())
    if (earthClock = $('#earth .time')).length > 0
      earthDate = new Date()
      earthClock.attr('data-hours', earthDate.getHours())
      earthClock.attr('data-minutes', earthDate.getMinutes())
      earthClock.attr('data-seconds', earthDate.getSeconds())
    requestAnimationFrame(setTime);
)(jQuery)
