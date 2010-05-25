Feature: Manage a person
  after assessing the child at a home visit, the social worker would enter the person(s) to be supported into the system and change their details

  Background:
    Given I am a new, authenticated user
    And a village called "Ta Mau Leu"

  Scenario: Add a new person
    When I go to the person list page
    And I add the person "Oum Bora"
    Then I should be on the person page for "Oum Bora"
    When I go to the person list page
    Then I should see the person "Oum Bora"

  Scenario: Add basic person information
    Given a person called "Oum Bora"
    When I go to the person page for "Oum Bora"
    And I follow "Edit basic information"
    And I fill in the following fields with
      | Field         | Type   | Value       |
      | Name          | Text   | Oum Bora 2  |
      | Date of birth | Text   | 1998-11-13  |
      | Religion      | Text   | Buddhist    |
    And I choose "Male"
    And I press "Save"
    Then I should be on the person page for "Oum Bora 2"
    And I should see the person "Oum Bora 2" with
      | Date of birth | 1998-11-13  |
      | Gender        | Male        |
      | Religion      | Buddhist    |
    
  Scenario: Add address
    Given a person called "Oum Bora"
    When I go to the person page for "Oum Bora"
    And I follow "Edit address"
    And I fill in the following fields with
      | Field         | Type   | Value       |
      | House number  | Text   | 15          |
      | Group number  | Text   | 8           |
      | Village       | Select | Ta Mau Leu  |
    And I press "Save"
    Then I should be on the person page for "Oum Bora"
    And I should see the person "Oum Bora" with
      | House number  | 15          |
      | Group number  | 8           |
      | Village       | Ta Mau Leu  |
    
  Scenario: Add siblings
    Given a person called "Oum Bora"
    When I go to the person page for "Oum Bora"
    And I follow "Edit siblings"
    And I add the following siblings
      | Oum Ary     |
      | Oum Phhoung |
    And I press "Save"
    Then I should be on the person page for "Oum Bora"
    And I should see the following siblings
      | Oum Ary     |
      | Oum Phhoung |

  Scenario: Make person a student
    Given a person called "Oum Bora"
    When I go to the person page for "Oum Bora"
    And I make "Oum Bora" a student
    Then "Oum Bora" should be a student