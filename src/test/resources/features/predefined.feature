@predefined
Feature: Smoke steps

  @predefined1
  Scenario: Predefined steps for Google
    Given I open url "https://google.com"
    Then I should see page title as "Google"
    Then element with xpath "//input[@name='q']" should be present
    When I type "Behavior Driven Development" into element with xpath "//input[@name='q']"
    Then I click on element using JavaScript with xpath "(//input[@name='btnK'])[1]"
    Then I wait for element with xpath "//*[@id='res']" to be present
    Then element with xpath "//*[@id='res']" should contain text "Cucumber"


  @predefined2
  Scenario: Predefined steps for Yahoo
    Given I open url "https://www.yahoo.com/"
    Then I should see page title as "Yahoo"
    Then element with xpath "//input[@name='p']" should be present
    When I type "Behavior Driven Development" into element with xpath "//input[@name='p']"
    Then I wait for 1 sec
    And I click on element with xpath "//button[@id='header-desktop-search-button']"
    Then I wait for element with xpath "//div[@id='results']" to be present
    Then element with xpath "//div[@id='results']" should contain text "cucumber"


  @predefined3
  Scenario: Predefined steps for Bing
    Given I open url "https://Bing.com"
    Then I should see page title as "Bing"
    Then element with xpath "//input[@name='q']" should be present
    When I type "Behavior Driven Development" into element with xpath "//input[@name='q']"
    Then I wait for 2 sec
    Then I click on element using JavaScript with xpath "//*[@type='submit']"
    Then I wait for element with xpath "//*[@id='b_results']" to be present
    Then element with xpath "//*[@id='b_results']" should contain text "Cucumber"
    Then I wait for 2 sec