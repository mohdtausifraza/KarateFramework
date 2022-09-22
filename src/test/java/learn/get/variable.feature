# <Gherkin Keyword> <def> <variable_name> = <value>
# * <def> <variable_name> = <value>

# Variable Use Case
    # Use variable for repeating value.
    # Storing the data from external file.
    # In the matchers Expression
    # Passing the data from one feature file to another.

Feature: Variables Creation in Karate Framework

  Background: Create And Initialize
    * def appName = 'Google'
    * def timeout = 20

  Scenario: To Create a Variable
    Given def var_int = 10
    And def var_string = 'karate'
    Then print 'Int Variable ==>', var_int
    And print 'String Variable ==>', var_string
    * def var_int2 = var_int + 10
    And print 'Updated Int ==> ', var_int2
    And print 'Background Variable ==>', appName, timeout


