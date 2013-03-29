$(function() {
  $(".picture").click(function() {
    id = $(this).attr('id');

    $.ajax({
		  url: window.location.pathname + "/" + id,
		  context: document.body
		}).done(function(data) {
    	$(".normal").html('<img src="' + data.image + '" class="pic_image round">');
    	$(".normal").fadeIn();
    	$(".background").fadeIn();
		});  

	});

	$(".background").click(function(){
    $(".normal").fadeOut();
    $(".background").fadeOut();
  });   
});
