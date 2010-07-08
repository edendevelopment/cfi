Feature: Manage siblings
  In order to track people from the same family
  As a user
  I want to be able to add and remove siblings from a person
  
  Scenario: Add siblings
    Given a person called "Oum Bora"
    And a person called "Person A"
    And I am a new, authenticated user
    When I go to the person page for "Oum Bora"
    And I follow "Edit siblings"
    And I add the sibling "Person A"
    Then I should be on the sibling page for "Oum Bora"
    Then I should see the sibling "Person A"

  Scenario: Remove siblings
    Given a person called "Oum Bora"
    And a person called "Person A"
    And "Person A" is a sibling of "Oum Bora"
    And I am a new, authenticated user
    When I go to the person page for "Oum Bora"
    And I follow "Edit siblings"
    And I remove the sibling "Person A"
    Then I should be on the sibling page for "Oum Bora"
    Then I should not see the sibling "Person A"
