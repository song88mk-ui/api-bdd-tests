@external
@platformapi
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
        "Password" : "secret"
      }
    """
    Then show me the response
    Then the response status should be "200"

  Scenario: Logout
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
      | x-operator-token | none |
    When I send and accept JSON
    When I send a POST request to "/v1/authentication/logout"
    Then show me the response
    Then the response status should be "200"

