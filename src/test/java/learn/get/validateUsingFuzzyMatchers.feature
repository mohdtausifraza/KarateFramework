Feature: To validate get end point
  To validate the get endpoint response

  Background: Setup the base URL
    Given url 'http://localhost:9897'

  Scenario: To get the data in Json Format And validate Using Fuzzy Matchers
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And match response[0].jobId == '#present'
    And match response[0].project[0].projectName == '#ignore'
    And match response[0].project == '#array'
    And match response[0].jobTitle == '#string'
    And match response[0].jobId == '#number'
    # Complex Fuzzy Matchers
    And match response[0].jobId == '#? _ >=1'
    And match response[0].jobTitle == '#string? _.length >= 1'
    # To validate Array
    And match response[0].experience == '#[]'
    And match response[0].experience == '#[3]'
    # To validate Size and Type
    And match response[0].experience == '#[3] #string'
    # Combining more expression
    And match response[0].experience == '#[3] #string? _.length >=2'




  Scenario: To get the data in XML Format And validate Using Fuzzy Matchers
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
    And print response
    And match /List/item/jobId == '#notnull'
    And match /List/item/project/project/projectName == '#present'
    # Complex Fuzzy Matchers
    And match /List/item/jobTitle == '#string? _.length >= 1'
    And match /List/item/jobTitle.id == '#notpresent'