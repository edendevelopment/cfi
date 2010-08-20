// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$().ready(function() {
  PeopleRelationshipsAutocompletion.setup();
})

PeopleRelationshipsAutocompletion = {
  setup: function() {
    if ($('.person_id, .student_id').size() > 0) {
      this.load_data(function(){
        PeopleRelationshipsAutocompletion.setup_autocomplete();
        PeopleRelationshipsAutocompletion.setup_user_removal();
      });
    }
  },

  load_data: function(callback) {
    $.getJSON('/students.js', function(data) {
      People.student_data = data;
      $.getJSON('/people.js', function(data) {
        People.people_data = data;
        callback();
      });
    });
  },

  setup_autocomplete: function() {
    $.each(['person', 'student'], function(index, type) {
      $('.' + type + '_id').replace_with_hidden_id_field(type);
      $('.' + type + '_id').add_autocomplete_field(type);
    });
  },

  setup_user_removal: function() {
    $('.people .button-to').ajaxDelete('.people');
    $('.add_student').each(function(index, element) {
      element = $(element);
      var people_element = element.prev('.people');
      element.ajaxForm({
        url: element.attr('action') + ".js",
        success: function(responseText) {
          var data = $(responseText);
          people_element.append(data);
          element.find('.student_search').val('');
          people_element.find('.button-to').ajaxDelete('.people');
        }
      });
    });
  },

  settings: {
    width: 320,
    max: 10,
    highlight: false,
    multiple: false,
    scroll: true,
    scrollHeight: 300,
    matchContains: true,
    mustMatch: true,
    formatItem: function(row) { return row['name_and_village']; }
  }
}

People = {
  student_data: undefined,
  people_data: undefined,
  data_for_type: function(type) {
    if (type == 'student') {
      return People.student_data;
    } else {
      return People.people_data;
    }
  }
}

jQuery.fn.replace_with_hidden_id_field = function(type) {
  id_field = $("<input type='hidden'/>").addClass(type + '_id')
             .attr('name', type + '_id');
  this.replaceWith(id_field);
}

jQuery.fn.add_autocomplete_field = function(type) {
  if (this.length == 0) { return; }
  search_field = $("<input type='text'/>").addClass(type + '_search')
                 .attr('autocomplete', 'off')
                 .attr('name', type + '_search');
  this.before(search_field);
  var current_parent = this.parent();
  current_parent.find('.' + type + '_search')
    .autocomplete(People.data_for_type(type), PeopleRelationshipsAutocompletion.settings)
    .result(function(input_field, result) {
      if (result != undefined) {
        $(this).parent().find('.' + type + '_id').val(result['id']);       // Set hidden form element
      }
    });
}
