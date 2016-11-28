$( document ).ready(function() {
	img = document.getElementById('post_cover_img');
	if( img != null){
  		img.addEventListener('change', handleFileSelect, false);
	}
});  