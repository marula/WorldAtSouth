$(function() {
  $(".thumb").click(function() {
    id = $(this).attr('id');

    $.ajax({
		  url: window.location.pathname + "/" + id,
		  context: document.body
		}).done(function(data) {
    	$(".normal").html('<img src="' + data.image + '">');
    	$(".normal").fadeIn();
		});  

	});
});
