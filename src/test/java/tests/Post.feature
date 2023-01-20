Feature: Post API test

  Background: 
    * url "https://reqres.in/api/"
    * header Accept = "application/json"
    * def expectedOutput = read("response1.json")

  # Post Request 1
  Scenario: Post request 1
    Given url "https://reqres.in/api/users"
    And request {"name": "Luis","job": "QA"}
    When method POST
    Then status 201
    And print response

  # Post Request with Background
  Scenario: Post request 2
    Given path "/users"
    And request {"name": "Fernando","job": "Lead"}
    When method POST
    Then status 201
    And print response

  # Post Request with Assertion
  Scenario: Post request 3
    Given path "/users"
    And request {"name": "Francisco","job": "Dev"}
    When method POST
    Then status 201
    And match response == {"name": "Francisco","job": "Dev", "id": "#string", "createdAt": "#ignore"}
    And print response

  # Post Request reading response from file
  Scenario: Post request 4
    Given path "/users"
    And request {"name": "Abril","job": "Princess"}
    When method POST
    Then status 201
    And match response == expectedOutput
    And print response

  # Post Request request from file
  Scenario: Post request 5
    Given path "/users"
    And def requestBody = read("request1.json")
    And request requestBody
    When method POST
    Then status 201
    And match response == expectedOutput
    And print response

  # Read body data from file and change request values
  Scenario: Post request 6
    Given path "/users"
    And def reqBody = read("request1.json")
    And set reqBody.job  = "engineer"
    And request reqBody
    When method POST
    Then status 201
    And match response == expectedOutput
    And print response
