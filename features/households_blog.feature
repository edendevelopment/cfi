Feature: Social worker adds notes to a household
  In order to keep notes on visits by social workers to households
  As a social worker only
  I want to make and edit notes for particular households on the system

  Scenario: Social worker adds notes to a household
    Given I am a new, authenticated social worker
    And a household called "Hun"
    When I go to the page for household "Hun"
    And I fill in "Note" with "Nice and clean!"
    And I press "Add note"
    Then "Nice and clean!" should be a note for household "Hun"

  Scenario: Social worker changes notes after the fact
    Given I am a new, authenticated social worker with email "test@example.com" and password "password"
    And a household called "Hun"
    And a note "Nice and clean!" for household "Hun" and user "test@example.com"
    When I go to the page for household "Hun"
    And I follow "Edit" within ".edit-comment"
    Then I should be on the note edit page for "Nice and clean!" on household "Hun"
    And the "comment_comment" field should contain "Nice and clean!"
    And I fill in "comment_comment" with "Nice and clean and bright!"
    And I press "Update"
    Then I should be on the page for household "Hun"
    And "Nice and clean and bright!" should be a note for household "Hun"
  
  Scenario: Social worker deletes note
    Given I am a new, authenticated social worker with email "test@example.com" and password "password"
    And a household called "Hun"
    And a note "Nice and clean!" for household "Hun" and user "test@example.com"
    When I go to the page for household "Hun"
    And I press "Remove" within ".delete-comment"
    Then I should be on the page for household "Hun"
    And I should not see "Nice and clean!"
  
  Scenario: Non social worker cannot access any of the notes
    Given I am a new, authenticated user
    And a household called "Hun"
    And a note "Nice and clean!" for household "Hun" and user "test@example.com"
    When I go to the page for household "Hun"
    Then I should not see "Nice and clean!"

  Scenario: Social worker adds pictures to notes
    Given I am a new, authenticated social worker
    And a household called "Hun"
    When I go to the page for household "Hun"
    And I add the note "This is a photo" with photo "sample.jpg" to the household
    Then I should see the note "This is a photo" with photo "sample.jpg"

