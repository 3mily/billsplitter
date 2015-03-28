$( document ).ready(function() {
	$('.contact').on('click', function(){
		$(this).remove();
		$('#selected').append(this);
	})	
});


$(document).on('submit', '#invite-pjax', function(event) {
  $.pjax.submit(event, '#pjax-container');

})