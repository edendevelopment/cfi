// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$().ready(function() {
  data = [
    {'id':1, 'name':'c++'},
    {'id':2, 'name':'java'},
    {'id':3, 'name':'javascript'},
    {'id':4, 'name':'jquery'}
  ];

  $("#person_search").autocomplete(data, {
    width: 320,
    max: 4,
    highlight: false,
    multiple: false,
    scroll: true,
    scrollHeight: 300,
    formatItem: function(row) { return row['name']; }
  });

  $("#person_search").result(function(input_field, result) {
    $('#person_id').val(result['id']);
  });
})
