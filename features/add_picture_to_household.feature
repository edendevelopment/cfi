Feature: User adds picture to household
  In order to show pictures for households, 
  As any user 
  I want to be able to upload a picture of the entire household to the household page

  Scenario: User attaches picture to household
    Given I am a new, authenticated user
    And a household called "Hun"
    When I upload a picture for household "Hun"
    Then I should see a picture for the household

  Scenario: User removes picture from household
    Given I am a new, authenticated user
    And a household called "Hun"
    And a picture for household "Hun"
    When I remove the picture for household "Hun"
    Then I should not see a picture for the household

