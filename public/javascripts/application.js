// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$().ready(function() {
  People.autocomplete();
})

People = {
  autocomplete: function() {
    $("#person_search").autocomplete(data, {
      width: 320,
      max: 4,
      highlight: false,
      multiple: false,
      scroll: true,
      scrollHeight: 300,
      matchContains: true,
      mustMatch: true,
      formatItem: function(row) { return row['name']; }
    });

    $("#person_search").result(function(input_field, result) {
      $('#person_id').val(result['id']);
    });
  }
}
