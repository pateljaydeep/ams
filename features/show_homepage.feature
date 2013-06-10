Feature: Show Homepage
  In order to see the asset types
  As a employee
  I want to load homepage

  Background: The user is logged in
    Given a logged in user

  Scenario: Load homepage
    Given I am on homepage
    Then I should see "Asset Types"
