$.fn.ajaxDelete = function(target) {
  $(this).each(function(index, form) {
    form = $(form);
    var delete_link = $('<a href="#" class="ajax-delete">Remove</a>');
    delete_link.click(function() {
      if (form.find('input[type=submit]').attr('onclick')()) {
        var action = form.attr('action') + '.js';
        $.ajax( { 
          url: action,
          data: { _method: 'delete'},
          type: 'POST',
          success: function(responseText) {
            var newDiv = $(responseText)
            delete_link.closest(target).replaceWith(newDiv);
            newDiv.find('.button-to').ajaxDelete(target);
           }
        });
      }
      return false
    });
    $(form).replaceWith(delete_link);
  })
}