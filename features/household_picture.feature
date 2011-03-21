Feature: User attaches picture to household
  In order to show pictures for households, 
  As any user 
  I want to be able to upload a picture of the entire household to the household page

  Scenario: User attaches picture to household
    Given I am a new, authenticated user
    And a household called "Hun"
    When I go to the page for household "Hun"
    And I follow "Edit"
    And I add the photo "sample.jpg" to the household
    And I press "Update"
    Then I should be on the page for household "Hun"
    And I should see a picture for the household

  Scenario: User removes picture from household
    Given I am a new, authenticated user
    And a household called "Hun"
    And a picture "sample.jpg" for household "Hun"
    When I go to the page for household "Hun"
    And I press "Remove picture"
    Then I should be on the page for household "Hun"
    And I should not see a picture for the household

