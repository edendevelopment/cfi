Jelly.Pages.add("Households", {
  index: function() {
    $('.household .student_list').hide();
    $('.household .students a').click(function() {
      $(this).closest('li').find('.student_list').toggle();
      return false;
    });
  }
});
