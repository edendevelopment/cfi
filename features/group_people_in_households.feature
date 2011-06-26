Feature: User adds person to household
    In order to keep track of which people are in which households
    As a user
    I want to be able to group people into households, labeling the households with the caretaker's name (string). There should be a description box (text), a contact information box (string) and a address box (text)

    Scenario: User adds household, with caretaker, description, contact info, and address box
        Given I am a new, authenticated user
        When I go to the household list page
        And I follow "add household"
        Then I should be on the new household page
        And I should see "Add a new household"
        And I fill in the following fields with
            | Field               | Type | Value                  |
            | Caretaker           | Text | Hun                    |
            | Description         | Text | Small family household |
            | Contact information | Text | Phone 23451123         |
            | Address             | Text | Phnom Penh             |
        And I press "add household"
        Then I should be on the household list page
        And I should see the household
            | Caretaker   | Description            | Contact_information | Address    |
            | Hun         | Small family household | Phone 23451123      | Phnom Penh |

    Scenario: User adds and removes person from household
        Given I am a new, authenticated user
        And a household called "Hun"
        And a person called "Oum Bora"
        When I go to the page for household "Hun"
        And I add "Oum Bora" to the household
        Then "Oum Bora" should be living in the household "Hun"
        When I remove "Oum Bora" from the household
        Then "Oum Bora" should not be living in the household "Hun"
