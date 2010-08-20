Feature: Log in
  In order to know who people are
  As the web developer
  I want people to log in to authenticate themselves

  Scenario: Christopher logs in
    Given I have one user "christopher@cfi.com" with password "password"
    When I go to the home page
    And I fill in "user_email" with "christopher@cfi.com"
    And I fill in "user_password" with "password"
    And I press "Sign in"
    Then I should be on the home page
