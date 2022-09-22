Feature: To validate get end point
  To validate the get endpoint response

  Background: Setup the base URL
    Given url 'http://localhost:9897'

  Scenario: To get the data in XML Format And validate XML Array
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
    And match response/List/item/jobId == '1'
    And match response/List/item/experience/experience[1] == 'Google'
    And match response/List/item/project/project/projectName == 'Movie App'
    And match response/List/item/project/project/technology/technology[1] == 'Kotlin'
    # Skip the response keyword
    And match /List/item/experience/experience[1] == 'Google'
    # Traverse XML similar to Json
    # Karate Allows XML to be traversed ad JSON using .
    And match response.List.item.experience.experience[0] == 'Google'
    # If we are Traversing like JSON which means we can also use Wildcard
    And match response.List.item.experience.experience contains 'Google'
