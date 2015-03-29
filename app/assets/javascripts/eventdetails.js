$(document).on('click', '.fa-close', function(){
  var clicked = $(this)
  var eventId = clicked.parents('.one-event').data('event-id')
  deleteEvent(eventId, clicked);

})

$(document).on('click', '.close-event', function(){
  var clicked = $(this)
  var eventId = clicked.parents('.one-event').data('event-id')

  updateEvent(eventId, clicked);
})

function updateEvent(id, currentEvent){
  $.ajax({
    url: "/events/"+ id,
    type: "PATCH",
    data: id,
    error: function(xhr,status,thrownError){
      console.log("it didnt save or work or something oh noes", thrownError);
    },
    success: function(response){
      console.log("success event updated");
      closedEvent = currentEvent.parents('.one-event');
      closedEvent.remove();
      $('#past-events').append(closedEvent);
      $('#past-events').children('#no-past').remove();
      closedEvent.children('.close-event').remove();
      closedEvent.children('.removable').remove();
    }
  });  
}

function deleteEvent(id, currentEvent){
  $.ajax({
    url: "/events/"+ id,
    type: "DELETE",
    data: id,
    error: function(xhr,status,thrownError){
      console.log("it didnt save or work or something oh noes", thrownError);
    },
    success: function(response){
      console.log("success event deleted")
      currentEvent.parents('.one-event').remove();
    }
  });  
}