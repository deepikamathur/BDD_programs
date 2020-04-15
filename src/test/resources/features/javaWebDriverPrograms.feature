@java
Feature: performing webdriver ex


  @wd1
  Scenario: WebDriver functions
    Given I go to "google" page and print details test
    And I go back and forward, then refresh the page


  @wd2
  Scenario: Loop through urls
    Given I open url "https://www/google.com" then "https:www.facebook.com" then "https://www/amazon.com"

  @wd3
  Scenario: Quote with required fields
    Given I open url "quote" page
    When I fill out first name "Deepika" and last name "Mathur"
    And I fill out required fields
    Then I assert required fields

  @wd4
  Scenario: Responsive UI
    Given I open url "quote" page one
    When I change resolution to "phone"