# Karate Framework
- It is a open source tool for **API Automation**, **Performance Testing** as well as **UI Automation**.
- It is developed on top of **Cucumber Library**.
- In case of normal Cucumber Project we have :
    - **Feature file** (.feature) which contains all the scenarios.
    - **Step Definition file** (.java) contains the java code for each step defined in the feature file.
    - **Runner** (.java) Which will combine all these file and execute the scenarios.
- In case of Karate there is no **Step Definition** File.
    - **Feature File**
    - **Runner**

- It provides some additional keyword, using which **you can write the automation script directly inside the feature file** without the need of the **Step Definition File**.


### Dependency
- Create a maven project with archetype "com.intuit.karate", or
- Add the below dependencies
  - karate-apache
  - karate-junit5

# BDD (Behavioural Driven Development) Keyword
#### Gherkin Keyword (Provided by Gherkin Language)
- Feature -- Title of Feature File. It describes about the feature under test.
- Test is divided into three parts, and for all there is a Gherkin Keyword
  - **Given** : (Setup or Prerequisite)  
  - **When** : (Action)
  - **Then** : (Validation)
  - For Multiple Action We can Use **And** keyword with the above Keyword.

