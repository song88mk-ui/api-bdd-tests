@internal
@auth-api
Feature: Auth API - User Controller
  As DevOps
  I want to make sure all the endpoints are working

  Scenario: Register
    Given I have auth API Key
    When I set headers:
      | x-app-id         | 1001                                 |
      | x-operator-token | f7db3cf9-7740-4654-a77e-664e1b3ff85b |
      | Authorization    | Basic Bearer xyz                     |
    When I send and accept JSON
    When I send a POST request to "/v1/api/User/register" with the following:
    """
      {
        "UserId" : "test",
        "Password" : "secret"
      }
    """
    Then the response status should be "401"
    And the JSON response should have "$.statusCode" with the text "401"
    And the JSON response should have "$.message" with the text "Unauthorized"

  Scenario: Get Current User
    Given I have auth API Key
    When I set headers:
      | x-app-id         | 1001                                 |
      | x-operator-token | f7db3cf9-7740-4654-a77e-664e1b3ff85b |
      | Authorization    | Basic Bearer xyz                     |
    When I send and accept JSON
    When I send a GET request to "/v1/api/User/test"
    Then the response status should be "401"
    And the JSON response should have "$.statusCode" with the text "401"
    And the JSON response should have "$.message" with the text "Unauthorized"

  @current
  Scenario: Get Manage User List
    Given I have auth API Key
    When I set headers:
      | x-app-id         | 1001                                 |
      | x-operator-token | f7db3cf9-7740-4654-a77e-664e1b3ff85b |
      | Authorization    | Basic Bearer xyz                     |
    When I send and accept JSON
    When I send a POST request to "/v1/api/User/list" with the following:
    """
      {
        "SearchText": "test"
      }
    """
    Then the response status should be "401"
    And the JSON response should have "$.statusCode" with the text "401"
    And the JSON response should have "$.message" with the text "Unauthorized"
