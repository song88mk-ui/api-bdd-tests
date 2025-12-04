@internal
@operator-api
Feature: Operator API
  As DevOps
  I want to make sure all the endpoints are working

    @current
  Scenario: Login
    Given I have platform API Key
    When I set headers:
      | x-client-id      | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
      | x-operator-token | c412bbe4-057d-4002-a11c-04fb101d3a77 |
      | x-is-agent       | false                                |
    When I send and accept JSON
    When I send a POST request to "/operator/v1/authentication/login" with the following:
    """
      {
        "UserName" : "test",
        "Password" : "test",
        "UserAgent": "Cucumber/1.0",
        "IpAddress": "127.0.0.1",
        "Country": "PH"
      }
    """
    Then the response status should be "200"
    And the JSON response should have "$.statusId" with the text "1000"

    @current
  Scenario: Logout
    Given I have platform API Key
    When I set headers:
      | x-operator-token | c412bbe4-057d-4002-a11c-04fb101d3a77 |
    When I send and accept JSON
    When I send a POST request to "/operator/v1/authentication/logout"
    Then the response status should be "200"
    And the JSON response should have "$.statusId" with the text "1000"
