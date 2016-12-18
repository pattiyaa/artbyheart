//= require login
(function() {
  $(function() {
    var modal_holder_selector, modal_selector;
    modal_holder_selector = '#modal-holder';
    modal_selector = '.modal';

    $('button[data-dismiss]').click(function(){
      
      $('.modal-backdrop').remove();
    });
    $('a[data-modal]').click(function(event){
      
      event.stopImmediatePropagation();
      var location;
      location = $(this).attr('href');
      $.get(location, function(data) {
        return $(modal_holder_selector).html(data).find(modal_selector).modal();
      });
      return false;
    });
    return $(document).on('ajax:success', 'form[data-modal]', function(event, data, status, xhr) {
      
      var url;
      url = xhr.getResponseHeader('Location');
      
      if (url) {
        $('.modal-backdrop').remove();
        window.location = url;
      } else {
        $('.modal-backdrop').remove();
        $(modal_holder_selector).html(data).find(modal_selector).modal();
      }
      return false;
    });

    
  });

}).call(this);