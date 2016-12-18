$( document ).ajaxError(function( event, request, settings ) {
	  if (settings.url.split('?')[0]=="/users/login"){
	  	$('p.alert').children('span').remove();
	  	 if(request.status == 401){
	  	 	$('p.alert').append("<span>username or password is incorrect</span>");
	  	 }else{
	  	 	$('p.alert').append("<span>" +request.responseText+"</span>");
	  	 }
	  }	  
});
$(document).on('ajax:success', 'form#login-box', function(event, data, status, xhr) {
	 	
	 	if (data.success){
	      $('#mainModal').modal('hide');
	      location.reload();
	      
	    }else{
	    	debugger

	      $('p.alert').append("<span>" +data.msg+"</span>");
	  	}
	    
});	