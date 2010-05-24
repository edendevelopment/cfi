Feature: Photo album
  In order to get a better understanding of the environment a child lives in
  As a user
  I want to upload photos of their life

  Scenario: User uploads photo
    Given I am a new, authenticated user
    And a person called "Oum Bora"
    When I go to the photos page for "Oum Bora"
    And I add the photo "sample.jpg" with comment "This is a photo"
    Then I should see the photo "sample.jpg" with comment "This is a photo"
  
  
  

  
