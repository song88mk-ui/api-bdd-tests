@internal
@auth-api
Feature: Auth API - User Controller
  As DevOps
  I want to make sure all the endpoints are working

  Scenario: Login as admin
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

  Scenario: Register
    Given I have auth API Key
    When I set headers:
      | x-app-id         | 1002 |
    When I add the access token
    When I send and accept JSON
    When I send a POST request to "/v1/api/User/register" with the following:
    """
    {
        "UserId": "test",
        "UserName" : "test",
        "Password" : "test",
        "Email": "test@example.com",
        "NickName": "test user",
        "Status": "Active",
        "MainUserId": "",
        "AppId": 1002,
        "AppName": "test",
        "RoleId": "test",
        "RoleName": "Default"
      }
    """
    Then the response status should be "400"
    And the JSON response should have "$.statusCode" with the text "1000"
    And the JSON response should have "$.message" with the text "Username 'test' is already taken. "

  Scenario: Get Current User
    Given I have auth API Key
    When I set headers:
      | x-app-id         | 1001 |
    When I add the access token
    When I send and accept JSON
    When I send a GET request to "/v1/api/User/3546c6d2-a83b-47c5-8a37-c1e2111543b5"
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: Get User
    Given I have auth API Key
    When I set headers:
      | x-app-id         | 1001 |
    When I add the access token
    When I send and accept JSON
    When I send a GET request to "/v1/api/User" with the following:
    #Examples:
      | id | 3546c6d2-a83b-47c5-8a37-c1e2111543b5 |
    Then show me the response
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: Get Manage User List
    Given I have auth API Key
    When I add the access token
    When I set headers:
      | x-app-id         | 1001                                 |
      | x-operator-token | f7db3cf9-7740-4654-a77e-664e1b3ff85b |
    When I send and accept JSON
    When I send a POST request to "/v1/api/User/list" with the following:
    """
      {
        "SearchText": "test"
      }
    """
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"
