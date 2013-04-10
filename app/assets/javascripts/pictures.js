$(function() {
  var prev, next;

  var changeImage = function(id){
    $.ajax({
      url: "/galleries/" + window.location.pathname.split('/')[2],
      context: document.body
    }).done(function(data) {
      if(data.list.indexOf(id) == 0){
        prev = data.list.length-1;
        next = data.list.indexOf(id) + 1;
      }
      else if(data.list.indexOf(id) == data.list.length-1){
        prev = data.list.indexOf(id) - 1;
        next = 0;
      }
      else{
        prev = data.list.indexOf(id) - 1;
        next = data.list.indexOf(id) + 1;
      }

      prev = data.list[prev];
      next = data.list[next];      
    }); 

    $.ajax({
      url: window.location.pathname + "/" + id,
      context: document.body
    }).done(function(data) {
      $(".pic_image").html('<img src="' + data.image + '" class="round">');
      $(".normal").fadeIn();
      $(".background").fadeIn();
    });  
  };

  $(".picture").click(function() {
    var id = +$(this).attr('id');
    changeImage(id);
	});

  $(".prev").click(function(){
    var id = prev;
    changeImage(id);
  });   

  $(".next").click(function(){
    var id = next;
    changeImage(id);
  });   

	$(".background").click(function(){
    $(".normal").fadeOut();
    $(".background").fadeOut();
  });   
});
