describe("People", function() {
  var search_field;

  beforeEach(function() {
    search_field = People.search_field('student');
  });

  describe("search_field", function() {
    it("has the correct class", function() {
      expect(search_field.attr('class')).toEqual('student_search');
    });

    it("returns a text field", function() {
      expect(search_field.attr('type')).toEqual('text');
    });
  });

  describe("id_field", function() {
    it("returns a hidden field", function() {
      id_field = People.id_field('person');
      expect(id_field.attr('type')).toEqual('hidden');
    });
  });

  describe("data for type", function() {
    beforeEach(function() {
      People.student_data = 'student_data';
      People.people_data = 'people_data';
    });

    it("returns student data if type is student", function() {
      expect(People.data_for_type('student')).toEqual('student_data');
    });

    it("returns people data if type is not student", function() {
      expect(People.data_for_type('anythingElse')).toEqual('people_data');
    });
  });
});
