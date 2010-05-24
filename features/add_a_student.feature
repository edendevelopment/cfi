Feature: Manage a student
  after assessing the child at a home visit, the social worker would enter the person(s) to be supported into the system and change their details

  Background:
    Given I am a new, authenticated user
    And a village called "Ta Mau Leu"

  Scenario: Add a new student
    When I go to the student list page
    And I follow "add student"
    Then I should be on the new student page
    And I should see "Add a new student"
    And I fill in the following fields with
      | Field         | Type   | Value       |
      | Name          | Text   | Oum Bora    |
      | Date of birth | Text   | 1998-11-13  |
      | House number  | Text   | 15          |
      | Group number  | Text   | 8           |
      | Village       | Select | Ta Mau Leu  |
      | Religion      | Text   | Buddhist    |
    And I choose "Male"
    And I add the following siblings
      | Oum Ary     |
      | Oum Phhoung |
    And I press "add student"
    Then I should be on the student page for "Oum Bora"
    And I should see the student "Oum Bora" with
      | Date of birth | 1998-11-13  |
      | Village       | Ta Mau Leu  |
      | Gender        | Male        |
      | House number  | 15          |
      | Group number  | 8           |
      | Village       | Ta Mau Leu  |
      | Religion      | Buddhist    |

    And I should see the following siblings
      | Oum Ary     |
      | Oum Phhoung |

    When I go to the student list page
    Then I should see the student "Oum Bora"

  Scenario: Change student details
    And a student called "Oum Bora"
    When I go to the student page for "Oum Bora"
    And I update the student with the following details
      | Field | Type | Value     |
      | Name  | Text | Oum Botam |
    Then I should be on the student page for "Oum Botam"
