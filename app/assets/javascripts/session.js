$(document).on('submit', '#login-pjax', function(event) {
  $.pjax.submit(event, '#pjax-container');
  $('.log-out').show();
})

$(document).on('click', '.log-out', function(){
  $(this).hide();
})