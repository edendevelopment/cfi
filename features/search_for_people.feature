Feature: Search for people
  In order to find a person more easily
  As a user
  I want to search for people by name

  Scenario: User searches for a person
    Given I am a new, authenticated user
    And these people:
      | Chuab Chareb       |
      | Ya                 |
      | Seam Makara        |
      | Chuab Aat          |
      | Chhoh Marody       |
      | Pleak Chan Boromey |
      | Chheang Pheak      |
    When I search people for "Chuab"
    Then I should see these people:
      | Chuab Chareb       |
      | Chuab Aat          |

  Scenario: No results for a search
    Given I am a new, authenticated user
    When I search people for "Chuab"
    Then I should see "No people found."
