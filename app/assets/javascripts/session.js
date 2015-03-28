$(document).on('submit', '#login-pjax', function(event) {
  $.pjax.submit(event, '#pjax-container')
})