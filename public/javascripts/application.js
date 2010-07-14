// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$().ready(function() {
  People.autocomplete();
})

People = {
  search_field: function(type) {
    return $("<input />").addClass(type + '_search').
      attr('type', 'text').
      attr('autocomplete', 'off').
      attr('name', type + '_search')
  },

  id_field: function(type) {
    return $('<input />').addClass(type + '_id').
      attr('type', 'hidden').
      attr('name', type + '_id')
  },

  autocomplete: function() {
    $.each(['person', 'student'], function(index, type) {
      if (type == 'student') {
        data = student_data;
      } else {
        data = people_data;
      }
      
      $('.' + type + '_id').replaceWith(People.id_field(type));
      $('.' + type + '_id').before(People.search_field(type));

      $('.' + type + '_search').autocomplete(data, {
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

      $('.' + type + '_search').result(function(input_field, result) {
        $('.' + type + '_id').val(result['id']);
      });
    });
  }
}
