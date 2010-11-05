Jelly.Pages.add("Households", {
  index: function() {
    $('.household .person_list').hide();
    $('.household .people a').click(function() {
      $(this).closest('li').find('.person_list').toggle();
      return false;
    });
  }
});
