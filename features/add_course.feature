Feature: Manage a course
  Administrators create a course of study

  Scenario: Add a new course
    When I go to the course list page
    And I follow "add course"
    Then I should be on the new course page
    And I should see "Add a new course"
    And I fill in the following fields with
      | Name     | Khmer 1       |
      | Time     | 08:30 - 09:30 |
      | Schedule | M-F           |
      | Teacher  | Genev         |
    And I press "add course"
    Then I should be on the course list page
    And I should see the course 
      | Name    | Time          | Schedule | Teacher |
      | Khmer 1 | 08:30 - 09:30 | M-F      | Genev   |