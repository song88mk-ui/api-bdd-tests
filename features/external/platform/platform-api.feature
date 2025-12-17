@external
@platformapi
@authentication
Feature: Platform Integration API
  As DevOps
  I want to make sure all the endpoints are working

  Scenario: Login on G01
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

  Scenario: Logout on G01
    Given I have platform API Key
    When I add the operator token
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send a POST request to "/v1/authentication/logout"
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: Login on FCX
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | 1665C10D-A663-47EE-4779-08D8F8BDFB57 |
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

  Scenario: Logout on FCX
    Given I have platform API Key
    When I add the operator token
    When I set headers:
      | X-Client-Id | 1665C10D-A663-47EE-4779-08D8F8BDFB57 |
    When I send a POST request to "/v1/authentication/logout"
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: Login on FCI
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F664DD52-D78E-47D5-9DF6-08D9092E23AF |
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

  Scenario: Logout on FCI
    Given I have platform API Key
    When I add the operator token
    When I set headers:
      | X-Client-Id | F664DD52-D78E-47D5-9DF6-08D9092E23AF |
    When I send a POST request to "/v1/authentication/logout"
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"
