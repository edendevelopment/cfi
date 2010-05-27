Feature: Commenting on people
  In order to provide more focussed information on a person
  As a user
  I want to add multiple dated comments on a user

  Scenario: Add a comment
    Given I am a new, authenticated user
    And a person called "Oum Bora"
    When I go to the person page for "Oum Bora"
    And I add the comment "This is a comment on the student"
    Then the person "Oum Bora" should have the comments "This is a comment on the student"
  
  Scenario: Edit a comment
    Given I am a new, authenticated user
    When a person called "Oum Bora"
    And a comment on "Oum Bora" profile
    And I go to the person page for "Oum Bora"
    Then I should see 1 comment
    When I edit the comment with "This is an edited comment"
    Then I should be on the person page for "Oum Bora"
    And the person "Oum Bora" should have the comments "This is an edited comment"
  
  
  
