#= require jquery
#= require bootstrap
#= require eorzea_time

(($)->
  'use strict';

  $ ->
    timeElement = $('.time')

    do setTime = ->
      time = new EorzeaTime.Date()
      timeElement.attr('data-hours', time.getHours())
      timeElement.attr('data-minutes', time.getMinutes())
      timeElement.attr('data-seconds', time.getSeconds())
      requestAnimationFrame(setTime);
)(jQuery)
