$( document ).ready(function() {
	$(document).on('click', '.contact', function(){
		$(this).remove();
		$('#selected').append(this);
	})	
});


$(document).on('submit', '#invite-pjax', function(event) {
  $.pjax.submit(event, '#pjax-container');

})