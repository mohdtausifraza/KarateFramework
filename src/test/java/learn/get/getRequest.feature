Feature: To test the get endpoint of the application
  To Test different get endpoint with different data format supported by the application

  Background: Setup the base path
    Given url 'http://localhost:9897'
    And print "=========This is Background Keyword==========="
    
  Scenario: To get all the data from application in JSON format
    # url is the Karate keyword to specify target URL
    ##Given url 'http://localhost:9897/normal/webapi/all'
    Given path '/normal/webapi/all'
    # sends the get request
    When method get
    # The response Status Code should be 200
    Then status 200

  Scenario: To get all the data from application in JSON format Using Path Variable
    #Given url 'http://localhost:9897'
    And path '/normal/webapi/all'
    When method get
    # The response Status Code should be 200
    Then status 200

    # ===========Using Header Keyword, Getting Response in XML================#
  Scenario: To get all the data from application in XML format Using Path Variable
    # BasePart
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
