Feature: To validate get end point
  To validate the get endpoint response

  Background: Setup the base URL
    Given url 'http://localhost:9897'

  Scenario: To get the data in Json Format
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
      # This response variable is provided by the karate framework
      # This will contain the response
    And print response
    And match response ==
      """
      [
        {
          "jobId": 1,
          "jobTitle": "Software Engg",
          "jobDescription": "To develop andriod application",
          "experience": [
            "Google",
            "Apple",
            "Mobile Iron"
          ],
          "project": [
            {
              "projectName": "Movie App",
              "technology": [
                "Kotlin",
                "SQL Lite",
                "Gradle"
              ]
            }
          ]
        }
      ]
      """

  Scenario: To get the data in XML Format
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
    And print response
    And match response ==
    """
    <List>
      <item>
        <jobId>1</jobId>
        <jobTitle>Software Engg</jobTitle>
        <jobDescription>To develop andriod application</jobDescription>
        <experience>
          <experience>Google</experience>
          <experience>Apple</experience>
          <experience>Mobile Iron</experience>
        </experience>
        <project>
          <project>
            <projectName>Movie App</projectName>
            <technology>
              <technology>Kotlin</technology>
              <technology>SQL Lite</technology>
              <technology>Gradle</technology>
            </technology>
          </project>
        </project>
      </item>
    </List>
    """

  Scenario: To get the data in Json Format and validate using negate
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response
    # And match response != [Negate]
    And match response ==
    """
      [
        {
          "jobId": 1,
          "jobTitle": "Software Engg",
          "jobDescription": "To develop andriod application",
          "experience": [
            "Google",
            "Apple",
            "Mobile Iron"
          ],
          "project": [
            {
              "projectName": "Movie App",
              "technology": [
                "Kotlin",
                "SQL Lite",
                "Gradle"
              ]
            }
          ]
        }
      ]
      """

  Scenario: To get the data in Json Format and match a specific property
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response
    And match response contains deep {"jobDescription": "To develop andriod application"}
    # Matching a nested field
    And match response contains deep {"project": [{"projectName": "Movie App"}]}
    # Validating Headers
    And match header Content-Type == 'application/json'