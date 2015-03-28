$(document).on('submit', '#events-pjax', function(event) {
  $.pjax.submit(event, '#pjax-container')
})