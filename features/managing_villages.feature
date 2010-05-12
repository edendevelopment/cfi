Feature: Managing villages
  In order to be able to consistently track locations
  As a user
  I want to see and be able to add to a list of villages
  
  Scenario: User adds village
    Given I am a new, authenticated user
    When I go to the villages page
    And I add a village called "Wivelsfield"
    Then I should see "Wivelsfield" in the list of villages
  
  Scenario: User edits village
    Given I am a new, authenticated user
    And a village called "Wivelsfield"
    When I go to the villages page
    And I edit the village "Wivelsfield" to have name "Botley"
    Then I should see "Botley" in the list of villages
  
  Scenario: User sees list of students in village
    Given I am a new, authenticated user
    And a village called "Wivelsfield"
    And a student called "Oum Bora" in village "Wivelsfield"
    And a student called "Student 2" in village "Wivelsfield"
    When I go to the page for village "Wivelsfield"
    Then I should see the student "Oum Bora"
    Then I should see the student "Student 2"
