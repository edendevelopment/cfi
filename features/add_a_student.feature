Feature: Manage a student
  after assessing the child at a home visit, the social worker would enter the person(s) to be supported into the system and change their details

  Scenario: Add a new student
    When I go to the student list page
    And I follow "add student"
    Then I should be on the new student page
    And I should see "Add a new student"
    And I fill in the following fields with
      | Name          | Oum Bora                                                                   |
      | Date of birth | 1998-11-13                                                                 |
      | Village       | Ta Mau Leu                                                                 |
      | Notes         | This student is currently living at home and supported by his grandmother. |
    And I choose "Male"
    And I add the following siblings
      | Oum Ary     | 
      | Oum Phhoung |
    And I press "add student"
    Then I should be on the student page for "Oum Bora"
    And I should see the student
      | Name          | Oum Bora                                                                   | 
      | Date of birth | 1998-11-13                                                                 |    
      | Village       | Ta Mau Leu                                                                 |
      | Gender        | Male                                                                       |
      | Notes         | This student is currently living at home and supported by his grandmother. |
      
    And I should see the following siblings
      | Oum Ary     | 
      | Oum Phhoung |

    When I go to the student list page
    Then I should see the student "Oum Bora"

  Scenario: Change student details
    Given a student called "Oum Bora"
    When I go to the student page for "Oum Bora"
    And I update the student with the following details
      | Name | Oum Botam |
    Then I should be on the student page for "Oum Botam"
