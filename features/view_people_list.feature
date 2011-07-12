Feature: View people list
  In order to find people more efficiently
  As a CFI volunteer
  I want to look for people paginated alphabetically

  Background:
    Given I am a new, authenticated user

  Scenario: People are arranged into alphabetical groups
    Given these people:
      | Chuab Chareb       |
      | Ya                 |
      | Seam Makara        |
      | Chuab Aat          |
      | Pleak Chan Boromey |
    When I go to the person list page
    And I follow "C"
    Then I should see these people:
      | Chuab Aat    |
      | Chuab Chareb |

    When I follow "S"
    Then I should see these people:
      | Seam Makara |
