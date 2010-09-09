Jelly.Pages.add("People", {
  index: function() {
    $('.add-new-person').hide();
    $('.add-new-person-control').click(function() {
      $('.add-new-person').toggle();
      return false;
    });
  }
});
