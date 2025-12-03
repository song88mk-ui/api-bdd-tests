@internal
@operator-api
Feature: Operator API
  As DevOps
  I want to make sure all the endpoints are working

  Scenario: Login
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a POST request to "/operator/v1/authentication/login" with the following:
    """
      {
        "UserName" : "test",
        "Password" : "secret",
        "UserAgent": "Cucumber/1.0",
        "IpAddress": "127.0.0.1",
        "Country": "PH"
      }
    """
    Then the response status should be "200"

  Scenario: Logout
    Given I have platform API Key
    When I set headers:
      | x-operator-token | f7db3cf9-7740-4654-a77e-664e1b3ff85b |
    When I send and accept JSON
    When I send a POST request to "/operator/v1/authentication/logout"
    Then show me the response
    Then the response status should be "200"
