@internal
@auth-api
Feature: Auth API - Auth Controller
  As DevOps
  I want to make sure all the endpoints are working

  Scenario: Login
    Given I have auth API Key
    When I send and accept JSON
    When I send a POST request to "/v1/login" with the following:
    """
      {
        "Username" : "fci-admin",
        "Password" : "secret",
        "Provider": "1001",
        "UserAgent": "Cucumber/1.0",
        "IpAddress": "127.0.0.1",
        "Country": "PH"
      }
    """
    Then the response status should be "200"
    Then I will have an operator token
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: Get User Online
    Given I have auth API Key
    When I send and accept JSON
    When I send a GET request to "/v1/online"
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: Logout
    Given I have auth API Key
    When I send and accept JSON
    When I add the operator token
    When I send a POST request to "/v1/logout"
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"
