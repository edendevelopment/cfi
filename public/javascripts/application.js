// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$().ready(function() {
  People.student_data = student_data;
  People.people_data = people_data;
  People.autocomplete();
})

People = {
  student_data: undefined,
  people_data: undefined,
  search_field: function(type) {
    return $("<input type='text'/>").addClass(type + '_search').
      attr('autocomplete', 'off').
      attr('name', type + '_search');
  },

  id_field: function(type) {
    return $("<input type='hidden'/>").addClass(type + '_id').
      attr('name', type + '_id');
  },

  data_for_type: function(type) {
    if (type == 'student') {
      return People.student_data;
    } else {
      return People.people_data;
    }
  },

  autocomplete_settings: {
    width: 320,
    max: 10,
    highlight: false,
    multiple: false,
    scroll: true,
    scrollHeight: 300,
    matchContains: true,
    mustMatch: true,
    formatItem: function(row) { return row['name_and_village']; }
  },

  autocomplete: function() {
    $.each(['person', 'student'], function(index, type) {
      $('.' + type + '_id').replace_with_hidden_id_field(type);
      $('.' + type + '_id').add_autocomplete_field(type);
    });
  }
}

jQuery.fn.replace_with_hidden_id_field = function(type) {
  this.replaceWith(People.id_field(type));
}

jQuery.fn.add_autocomplete_field = function(type) {
  if (this.length == 0) { return; }
  this.before(People.search_field(type)); // adds the search field
  current_parent = this.parent();
  current_parent.find('.' + type + '_search')
    .autocomplete(People.data_for_type(type), People.autocomplete_settings)
    .result(function(input_field, result) {
      $(this).parent().find('.' + type + '_id').val(result['id']);
    });
}
