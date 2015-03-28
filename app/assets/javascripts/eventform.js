$(document).on('submit', '#events-pjax', function(event) {
  // event.preventDefault()
  $.pjax.submit(event, '#pjax-container')
})