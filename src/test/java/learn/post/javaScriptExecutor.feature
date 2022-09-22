Feature: To Execute the JavaScript Function

  Scenario: Execute JavaScript Function with and without parameters
    * def getIntValue = function() { return 10;}
    Then print 'Function Value =', getIntValue()
    * def getRandomValue = function() { return Math.floor((100) * Math.random())}
    Then print 'Random Value =', getRandomValue()
    * def getStringValue = function(arg1) {return "Hello " + arg1}
    Then print 'Get String Value =', getStringValue("Tausif")