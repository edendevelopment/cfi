// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$().ready(function() {
  People.autocomplete();
})

People = {
  autocomplete: function() {
    var search_field = $("<input />").attr('id', 'person_search').
      attr('type', 'text').
      attr('autocomplete', 'off').
      attr('name', 'person_search');

    var id_field = $('<input />').attr('id', 'person_id').
      attr('type', 'hidden').
      attr('name', 'person_id');

    $('#person_id').replaceWith(id_field);
    id_field.before(search_field);

    $("#person_search").autocomplete(people_data, {
      width: 320,
      max: 4,
      highlight: false,
      multiple: false,
      scroll: true,
      scrollHeight: 300,
      matchContains: true,
      mustMatch: true,
      formatItem: function(row) { return row['name_and_village']; }
    });

    $("#person_search").result(function(input_field, result) {
      $('#person_id').val(result['id']);
    });
  }
}
