Feature: Add a student to a class
  In order to track what students are in a class
  As a user
  I want to add a student to a class
  
  Scenario: User adds student to class
    Given I am a new, authenticated user
    And a course called "Khmer 1"
    And a student called "Oum Bora"
    When I go to the page for course "Khmer 1"
    And I add "Oum Bora" to the course
    Then "Oum Bora" should be taking the course "Khmer 1"
  
  Scenario: User removes a student from a class
    Given I am a new, authenticated user
    And a course called "Khmer 1"
    And a student called "Oum Bora"
    When I go to the page for course "Khmer 1"
    And I add "Oum Bora" to the course
    Then "Oum Bora" should be taking the course "Khmer 1"
    When I remove "Oum Bora" from the course
    Then "Oum Bora" should not be taking the course "Khmer 1"
