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

    #Examples:
      | UserName | test |
      | Password | test |

    Then the response status should be "200"

  Scenario: Logout
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
      | x-operator-token | none |
    When I send and accept JSON
    When I send a POST request to "/v1/authentication/logout"
    Then the response status should be "200"

  Scenario: Get Balance with No Operator Token
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
      | x-operator-token | unset |
    When I send and accept JSON
    When I send a GET request to "/v1/wallet/balance"
    Then the response status should be "400"
    And the JSON response should have "$.statusCode" with the text "1001"
