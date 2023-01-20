Feature: Config test

  Background: 
    * url baseURL
    * header Accept = "application/json"

  Scenario: Config API Test
    Given print name

  # Get test config
  Scenario: Get API
    Given path "/users?page=2"
    When method GET
    Then status 200
    And print response
