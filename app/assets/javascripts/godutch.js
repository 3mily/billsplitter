$( document ).ready(function() {
	$('.contact').on('click', function(){
		$(this).remove();
		$('#selected').append(this);
	})	
});

