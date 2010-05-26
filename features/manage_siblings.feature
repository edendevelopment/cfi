Feature: Manage siblings
  In order to track people from the same family
  As a user
  I want to be able to add and remove siblings from a person
  
  Scenario: Add siblings
    Given a person called "Oum Bora"
    And a person called "Person A"
    And a person called "Person B"
    And I am a new, authenticated user
    When I go to the person page for "Oum Bora"
    And I follow "Edit siblings"
    And I add the siblings "Person A"
    Then I should be on the person page for "Oum Bora"
    And I should see the following siblings
      | Person A |
