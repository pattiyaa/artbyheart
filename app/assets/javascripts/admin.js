 $( document ).ready(function($) {
	 $('.carousel').carousel({
	      interval: 3000
	    });
	$('.onoffswitch-label ').click(function(){ 
		
	 	$id = $(this).attr('for'); 
	 	if ($('#'+$id).val() == 1){ 
	 	  $('#'+$id).val(0) ;
	 	  $('#'+$id).prop('checked', false);
	 	}else{
	 		$('#'+$id).val(1) ;
	 		$('#'+$id).prop('checked', true);
	 	}
	 	
	});
 });