describe("People", function() {
  var search_field;

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
