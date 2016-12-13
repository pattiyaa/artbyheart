$(document).ready(function() {
    $('.js-popup').click(function() {
        centerPopup($(this).attr('href'), $(this).attr('data-width'), $(this).attr('data-height'));
        return false;
    });
    return $(document).on('ajax:success', 'form#login-box', function(event, data, status, xhr) {
      var url;
      url = xhr.getResponseHeader('Location');
      debugger

      if (data.success){
      //javascript that executes if everything goes o.k.
        $('#sign_in').modal('hide')
        $('#sign_in_button').hide()
        $('#submit_comment').slideToggle(1000, "easeOutBack" )
      }else{
        alert('failure!')
      }
      return false;
    });
});

function centerPopup(linkUrl, width, height) {
    var sep = (linkUrl.indexOf('?') !== -1) ? '&' : '?',
        url = linkUrl + sep + 'popup=true',
        left = (screen.width - width) / 2 - 16,
        top = (screen.height - height) / 2 - 50,
        windowFeatures = 'menubar=no,toolbar=no,status=no,width=' + width +
            ',height=' + height + ',left=' + left + ',top=' + top;
    return window.open(url, 'authPopup', windowFeatures);
}

// $("form#login-box").bind "ajax:success", (e, data, status, xhr) ->
//     if data.success
//       //javascript that executes if everything goes o.k.
//       $('#sign_in').modal('hide')
//       $('#sign_in_button').hide()
//       $('#submit_comment').slideToggle(1000, "easeOutBack" )
//     else
//       alert('failure!')