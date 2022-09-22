Feature: To validate get end point
  To validate the get endpoint response

  Background: Setup the base URL
    Given url 'http://localhost:9897'

  Scenario: To get the data in Json Format And validate Json Array
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And match response[0].jobId == 1
    And match response[0].experience[1] == 'Apple'
    And match response[0].project[0].technology[1] == 'SQL Lite'
    # Validate the size of an array
    And match response[0].project[0].technology == '#[3]'
    # Using Wildcard Validation
    And match response[0].project[0].technology[*] == ['Kotlin','SQL Lite','Gradle']
    And match response[0].project[0].technology[*] contains 'Gradle'
