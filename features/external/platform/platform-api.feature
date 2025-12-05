@external
@platformapi
@hello
Feature: Platform Integration API
  As DevOps
  I want to make sure all the endpoints are working

  Scenario: Login
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a POST request to "/v1/authentication/login" with the following:
    """
      {
        "UserName" : "test",
        "Password" : "test"
      }
    """
    Then I will have an operator token
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: Logout
    Given I have platform API Key
    When I add the operator token
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a POST request to "/v1/authentication/logout"
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"
