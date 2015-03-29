$(document).on('click', '.fa-close', function(){
  var clicked = $(this)
  var eventId = clicked.parents('.one-event').data('event-id')
  deleteEvent(eventId);
  alert("delete this");

})

$(document).on('click', '.close-event', function(){
  var clicked = $(this)
  var eventId = clicked.parents('.one-event').data('event-id')

  updateEvent(eventId);

})

function updateEvent(id){
  $.ajax({
    url: "/events/"+ id,
    type: "PATCH",
    data: id,
    error: function(xhr,status,thrownError){
      console.log("it didnt save or work or something oh noes", thrownError);
    },
    success: function(response){
      console.log("success event updated")
    }
  });  
}


function deleteEvent(id){
  $.ajax({
    url: "/events/"+ id,
    type: "DELETE",
    data: id,
    error: function(xhr,status,thrownError){
      console.log("it didnt save or work or something oh noes", thrownError);
    },
    success: function(response){
      console.log("success event updated")
    }
  });  
}