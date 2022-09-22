Feature: To validate get end point
  To validate the get endpoint response

  Background: Setup the base URL
    Given url 'http://localhost:9897'

  Scenario: To get the data in Json Format and validate from file
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    * def actualResponse = read('jsonResponse.json')
    And print actualResponse
    And match response == actualResponse

  Scenario: To get the data in XML Format and validate from file
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
    * def actualResponse = read('xmlResponse.xml')
    And print actualResponse
    And match response == actualResponse