Feature: To Create the Job Entry in the application

  Background: Setup the base path
    Given url 'http://localhost:9897'

  Scenario: To Create the Job Entry in the Json Format
    Given path '/normal/webapi/add'
    And request read('request.json')
    And headers { Accept : 'application/json', Content-Type : 'application/json' }
    When method post
    And status 201
    Then match response.jobId == 5
    Given path '/normal/webapi/remove/5'
    When method delete

  Scenario: To Create the Job Entry in the XML Format
    Given path '/normal/webapi/add'
    And request read('request.xml')
    And headers { Accept : 'application/xml', Content-Type : 'application/xml' }
    When method post
    And status 201
    Then match /Job/jobId == '6'
    Given path '/normal/webapi/remove/6'
    When method delete

  Scenario: To Create the Job Entry in the Json Format using Embedded Expressions
    Given path '/normal/webapi/add'
    * def getJobTitle = function(arg1) {return "Sr. " + arg1}
    * def getJobId = function() { return Math.floor((100) * Math.random())}
    * def jobId = getJobId()
    And request {"experience": ["Google","Apple"],"jobDescription": "Software Engineer","jobId": #(jobId),"jobTitle": '#(getJobTitle(" Software Engineer"))',"project": [{"projectName": "Test Project","technology": ["Java","Python","MySql"]}]}
    And headers { Accept : 'application/json', Content-Type : 'application/json' }
    When method post
    And status 201
    And print jobId
    Then match response.jobId == '#(jobId)'
    Given path '/normal/webapi/remove/',jobId
    When method delete
