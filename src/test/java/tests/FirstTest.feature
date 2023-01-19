Feature: API test work

  Scenario: Get for test API
    Given url "https://reqres.in/api/users?page=2"
    When method GET
    Then status 200
