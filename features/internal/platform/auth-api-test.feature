@internal
@auth-api
Feature: Auth API - Test User
  As DevOps
  I want to make sure all the endpoints are working


  @current
  Scenario: Login as test user
    Given I have auth API Key
    When I send and accept JSON
    When I send a POST request to "/v1/login" with the following:
    """
      {
        "Username" : "test",
        "Password" : "test",
        "Provider": "1002",
        "UserAgent": "Cucumber/1.0",
        "IpAddress": "127.0.0.1",
        "Country": "PH"
      }
    """
    Then the response status should be "200"
    Then I will have an operator token
    Then show me the operator token
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"
