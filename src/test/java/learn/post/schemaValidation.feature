Feature: Validate the JSON Schema
  To validate the JSON Schema for POST /normal/webapi/add

  Background: Base URL
    Given url 'http://localhost:9897'

  Scenario: To create the job entry in JSON format and do Schema Validation
    Given path '/normal/webapi/add'
    And request read('request.json')
    And headers { Accept : 'application/json', Content-Type : 'application/json' }
    When method post
    And status 201
    And print response
    And match response ==
    """
      {
        "jobId" : '#number',
        "jobTitle" : '#string',
        "jobDescription" : '#string',
        "experience" : '#[] #string',
        "project" : '#[] #object'
      }
    """

  Scenario: Schema Validation from Get End Point
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    And status 200
    * def projectSchema = { "projectName" : '#string' , "technology":'#[] #string' }
    * def mainSchema = {"jobId": '#number',"jobTitle": '#string',"jobDescription": '#string',"experience": '#[] #string', "project":'#[] ##(projectSchema)'}
    And match response ==
    """
      '#[] ##(mainSchema)'
    """