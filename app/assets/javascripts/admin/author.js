$( document ).ready(function() {
	img = document.getElementById('author_avatarimg');
	if( img != null){
  		img.addEventListener('change', handleFileSelect, false);
	}
});  