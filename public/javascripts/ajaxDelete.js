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
            var course_people = delete_link.closest(target);
            var course_node = course_people.parent();
            console.log('delete_link', delete_link);
            console.log('course_people, pre replaceWith', course_people);
            course_people.replaceWith(responseText);
            console.log('course_people, post replaceWith', course_people);
            course_node.find('.people .button-to').ajaxDelete('.people');
           }
        });
      }
      return false
    });
    $(form).replaceWith(delete_link);
  })
}
