Feature: Get API test

  Background: 
    * url "https://reqres.in/api"
    * header Accept = "application/json"

  # Simple Get Request
  Scenario: Get request 1
    Given url "https://reqres.in/api/users?page=2"
    When method GET
    Then status 200
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies

  # Get with Background
  Scenario: Get request 2
    Given path "/users?page=2"
    When method GET
    Then status 200
    And print response

  # Get with Path, Params
  Scenario: Get request 3
    Given path "/users"
    And param page = 2
    When method GET
    Then status 200
    And print response

  # Get with Assertions
  Scenario: Get request 4
    Given path "/users"
    And param page = 2
    When method GET
    Then status 200
    And print response
    And match response.data[0].first_name != null
    And assert response.data.length == 6
    And match response.data[3].id == 10
    And match $.data[4].last_name == "Edwards"