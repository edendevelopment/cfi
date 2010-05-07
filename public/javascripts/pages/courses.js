Jelly.Pages.add("Courses", {
  index: function() {
    $('.course .student_list').hide();
    $('.course .students a').click(function() {
      $(this).closest('li').find('.student_list').toggle();
      return false;
    });
    
    $('.course .students .button-to').ajaxDelete();
  }
});
