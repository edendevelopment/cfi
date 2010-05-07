$.fn.ajaxDelete = function() {
  $(this).each(function(index, form) {
    form = $(form);
    var delete_link = $('<a href="#">Remove</a>');
    delete_link.click(function() {
      if (form.find('input[type=submit]').attr('onclick')()) {
        var action = form.attr('action');
        $.ajax( { 
          url: action,
          data: { _method: 'delete'},
          type: 'POST',
          success: function() {
            delete_link.closest('li').remove();
          }
        });
      }
      return false
    });
    $(form).replaceWith(delete_link);
  })
}