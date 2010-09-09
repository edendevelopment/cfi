$.fn.ajaxDelete = function(target) {
  $(this).each(function(index, form) {
    form = $(form);
    var delete_link = $('<a href="#" class="ajax-delete"><img src="/images/delete.png" alt="Remove" title="Remove" /></a>');
    var person_li_node = form.closest('li');
    delete_link.click(function() {
      if (form.find('input[type=submit]').attr('onclick')()) {
        var action = form.attr('action') + '.js';
        $.ajax( { 
          url: action,
          data: { _method: 'delete'},
          type: 'POST',
          success: function() {
            person_li_node.remove();
           }
        });
      }
      return false
    });
    $(form).replaceWith(delete_link);
  })
}
