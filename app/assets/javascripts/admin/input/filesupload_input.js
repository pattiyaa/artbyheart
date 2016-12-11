var elems = [];
var storedFiles =[];
  function handleFilesSelect(evt) {
    evt.stopPropagation();
    evt.preventDefault();
    var files = evt.target.files || evt.dataTransfer.files; // FileList object
  
    for (var i = 0, f; f = files[i]; i++) {   
      // Only process image files.
      if (!f.type.match('image.*')) {
        continue;
      }
      var reader = new FileReader();
      // Closure to capture the file information.
      reader.onload = drawImg(f);
      // Read in the image file as a data URL.
      reader.readAsDataURL(f);
    }
  }

  function handleDragOver(evt) {
    evt.stopPropagation();
    evt.preventDefault();
    evt.dataTransfer.dropEffect = 'copy'; // Explicitly show this is a copy.
  }
  function drawImg(theFile) {
        return function(e) {
          // Render thumbnail.
          var span = document.createElement('span');
          var div = document.createElement('div');
          div.className ="thumb";
          $index = "selectedfile_"+($('#itemcount').val()+1);
          removetag = '<a id="'+$index+'" class="remove pull-right" href="javascript:void(0)"><i class="fa fa-times-circle" aria-hidden="true"></i></a>';
          div.innerHTML = [removetag,'<img class="thumb" src="', e.target.result,
                            '" title="', escape(theFile.name), '"/>'].join('');
          document.getElementById('list').insertBefore(div, null);
          $("a#"+$index).click(function ( e ) {
            removeitem($(this));
          });
          storedFiles.push(e.target.result)
        };
  };
  function managetempfile(evt,$this){
      handleFilesSelect(evt);
      $hiddenform =$('#tempfiles');
      $clone = $this.clone();
      $this.attr("id","selectedfile_"+($('#itemcount').val()+1));
      $this.attr("class","temp");
      $this.after($clone).appendTo($hiddenform);
      $clone.change(function(evt){
      managetempfile(evt,$(this));
    });
  };
  function removeitem(obj){
      $("a#"+obj.attr('id')).parent().remove();
     $('input#'+obj.attr('id')).remove();
  }

$(document).ready(function() {
  // Setup the dnd listeners.
  var dropZone = document.getElementById('drop_zone');
  
  if(dropZone){
    dropZone.addEventListener('dragover', handleDragOver, false);
    // dropZone.addEventListener('drop', handleFilesSelect, false);
    dropZone.addEventListener('drop', function(evt){
      evt.stopPropagation();
      evt.preventDefault();
      $('input[type=file].original').prop("files", evt.dataTransfer.files);
      return false;

    });
  }
  $("a.remove").click(function ( e ) {
     removeitem($(this));
  });
  
  $('input[type=file].original').change(function(evt){
      managetempfile(evt,$(this));
    });
  $('input[type=submit]').click(function() {
    $('input[type=file].original').attr("id","select");
    $('input[type=file].original').attr("name","");  
  });
});