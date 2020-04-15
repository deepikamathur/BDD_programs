@getAquote
Feature: Test Get A Quote website functionality

  @ex1
  Scenario:Validate responsive UI behaviour
      #Verify that Application Section has Location/Date/Time
      # for Desktop and Tablet layouts but not in Phone layout

      #For Desktop
    Given I open url "https://skryabin.com/webdriver/html/quote.html"
    Then I resize window to 1100 and 946
    Then element with xpath "//b[@id='location']" should be displayed
    And element with xpath "//b[@id='currentDate']" should be displayed
    And element with xpath "//b[@id='currentTime']" should be displayed
    Then I wait for 5 sec
      #For Ipad
    Then I resize window to 900 and 946
    Then element with xpath "//b[@id='location']" should be displayed
    And element with xpath "//b[@id='currentDate']" should be displayed
    And element with xpath "//b[@id='currentTime']" should be displayed
    Then I wait for 5 sec
      #For Mobile
    Then I resize window to 600 and 946
    Then element with xpath "//b[@id='location']" should not be displayed
    And element with xpath "//b[@id='currentDate']" should not be displayed
    And element with xpath "//b[@id='currentTime']" should not be present
    Then I wait for 5 sec

  @ex2
  Scenario: Fill out and validate “Username” field
      #Validate minimal “Username” field length requirement as 2 characters

    Given I open url "https://skryabin.com/webdriver/html/quote.html"
    Then I type "a" into element with xpath "//input[@name='username']"
    Then I click on element with xpath "//input[@name='email']"
    Then element with xpath "//label[@id='username-error']" should have attribute "class" as "error"
    Then I wait for 5 sec

  @ex3
  Scenario: Validate "email" field behaviour
        #Validate that email field accepts only valid email addresses
    Given I open url "https://skryabin.com/webdriver/html/quote.html"
    Then I type "abc" into element with xpath "//input[@name='email']"
    Then I click on element with xpath "//input[@name='username']"
    Then element with xpath "//label[@id='email-error']" should have attribute "class" as "error"
    Then I wait for 5 sec

  @ex4
  Scenario: Fill out and validate “Password” set of fields
      #Validate that Confirm Password is disabled if Password field is empty.
    Given I open url "https://skryabin.com/webdriver/html/quote.html"
    When I clear element with xpath "//input[@id='password']"
    Then element with xpath "//input[@id='confirmPassword']" should be disabled
    Then I wait for 5 sec

  @ex5
  Scenario: Validate “Name” field behavior
        # Modal dialog verify that upon clicking inside of Name field popup dialog appears.
    Given I open url "https://skryabin.com/webdriver/html/quote.html"
    When I click on element with xpath "//input[@id='name']"
    Then element with xpath "//div[@class='ui-dialog ui-widget ui-widget-content ui-corner-all ui-front ui-dialog-buttons ui-draggable ui-resizable']" should be displayed
    Then I type "John" into element with xpath "//input[@id='firstName']"
    And I type "Mathew" into element with xpath "//input[@id='lastName']"
    When I click on element with xpath "//span[contains(text(),'Save')]"
    Then element with xpath "//input[@id='name']" should have attribute "value" as "John Mathew"
    Then I wait for 3 sec

  @ex6
  Scenario: Accepting Privacy Policy
        #Validate that Accepting Privacy Policy is required to submit the form, then check the field.
    Given I open url "https://skryabin.com/webdriver/html/quote.html"
    When I click on element with xpath "//input[@id='name']"
    Then element with xpath "//*[@aria-describedby='nameDialog']" should be displayed
    When I type "James" into element with xpath "//input[@id='firstName']"
    And I type "King" into element with xpath "//input[@id='lastName']"
    And I click on element using JavaScript with xpath "//span[contains(text(),'Save')]"
    Then element with xpath "//input[@id='name']" should have attribute "value" as "James King"
    When I type "JamesKing" into element with xpath "//input[@name='username']"
    And I type "James@gmail.com" into element with xpath "//input[@name='email']"
    And I type "12345" into element with xpath "//input[@id='password']"
    And I type "12345" into element with xpath "//input[@id='confirmPassword']"
    And I click on element using JavaScript with xpath "//button[@id='formSubmit']"
    Then element with xpath "//label[@id='agreedToPrivacyPolicy-error']" should have text as "- Must check!"
    And I wait for 5 sec

  @ex7
  Scenario: Enter all information in a form and submit
      #Validating the form is submitting successfully
    Given I open url "https://skryabin.com/webdriver/html/quote.html"
    Then I click on element with xpath "//input[@id='name']"
    Then I type "Sam" into element with xpath "//input[@id='firstName']"
    And I type "Louis" into element with xpath "//input[@id='lastName']"
    And I click on element with xpath "//span[contains(text(),'Save')]"
    Then I click on element with xpath "//select[@name='countryOfOrigin']"
    And I click on element with xpath "//option[contains(text(),'Germany')]"
    Then I type "San Jose 95126" into element with xpath "//textarea[@id='address']"
    And I type "Sam1234" into element with xpath "//input[@name='username']"
    And I type "SamLoius@gmail.com" into element with xpath "//input[@name='email']"
    And I type "12345" into element with xpath "//input[@id='password']"
    And I type "12345" into element with xpath "//input[@id='confirmPassword']"
    And I type "1626262872" into element with xpath "//input[@name='phone']"
    Then I click on element with xpath "//input[@id='dateOfBirth']"
    Then I click on element with xpath "//div[@id='ui-datepicker-div']"
    And I click on element with xpath "//span[contains(text(),'Female')]"
    Then I click on element with xpath "//input[@name='allowedToContact']"
    Then I click on element with xpath "//option[contains(text(),'BMW')]"
    And I click on element with xpath "//option[contains(text(),'Toyota')]"
    Then I click on element with xpath "//label[contains(text(),'Additional Information')]"
    Then I click on element with xpath "//input[@name='agreedToPrivacyPolicy']"
    And I click on element with xpath "//button[@id='formSubmit']"
    Then element with xpath "//legend[@class='applicationResult']" should have attribute "class" as "applicationResult"

    # Validate that password is not displayed on the page.
    Then element with xpath "//b[@name='password']" should contain text "[entered]"
    Then I wait for 5 sec

  @ex8
  Scenario: Validate Password confirm password with correct password
        #Validating password and confirm password with correct pw
    Given I open url "https://skryabin.com/webdriver/html/quote.html"
    When I type "12345" into element with xpath "//input[@id='password']"
    Then I type "12345" into element with xpath "//input[@id='confirmPassword']"
    And I click on element with xpath "//input[@name='email']"
    Then element with xpath "//label[@id='confirmPassword-error']" should not be present
    Then I wait for 5 sec

  @ex9
  Scenario: Validate Password confirm password with incorrect password
           #Validating password and confirm password with incorrect pw
    Given I open url "https://skryabin.com/webdriver/html/quote.html"
    When I type "12345" into element with xpath "//input[@id='password']"
    And I click on element with xpath "//input[@name='email']"
    Then element with xpath "//input[@id='confirmPassword']" should be enabled
    Then I type "123456" into element with xpath "//input[@id='confirmPassword']"
    And I click on element with xpath "//input[@name='email']"
    Then element with xpath "//label[@id='confirmPassword-error']" should have attribute "class" as "error"
    Then I wait for 5 sec


  @quote10

  Scenario: Validate Password with 5 characters
      #Validating password with more than 5 characters
    Given I open url "https://skryabin.com/webdriver/html/quote.html"
    When I type "12345" into element with xpath "//input[@id='password']"
    And I click on element with xpath "//input[@name='email']"
    Then element with xpath "//input[@id='confirmPassword']" should be enabled

