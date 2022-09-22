## It represents the title of the feature file and short description about the functionality we are going to test..
Feature: To test the get endpoint of the application
  To Test different get endpoint with different data format supported by the application

  Scenario: To test the get endpoint with Json data
    Given the application url 'www.google.com'
    And the context path is '/getdata'
    When I send the get reuest
    Then status code should be 200
    And the response format should be in JSON

    ## We can have Multiple Scenario in one feature file.