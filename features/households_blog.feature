Feature: Social worker adds notes to a household
  In order to keep notes on visits by social workers to households
  As a social worker only
  I want to make and edit notes for particular households on the system

  Scenario: Social worker adds notes to a household
    Given I am a new, authenticated social worker
    And a household called "Hun"
    When I go to the page for household "Hun"
    And I fill in "note" with "Nice and clean!"
    And I press "Add note"
    Then "Nice and clean!" should be a note for household "Hun"

  Scenario: Social worker changes notes after the fact
  Scenario: Social worker adds pictures to notes
  Scenario: Non social worker cannot access any of the notes

