@external
@platformapi
@betting
Feature: Platform Integration API - Betting
  As DevOps
  I want to make sure all the endpoints are working

  @current
  Scenario: Obtain an Operator Token
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

  Scenario: Get Balance
    Given I have platform API Key
    When I add the operator token
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v1/wallet/balance"
    Then show me the response
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: Bet Placement
    Given I have platform API Key
    When I add the operator token
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a POST request to "/v2/bet/placement" with the following:
    """
    {
      "BetDate": "2025-12-01T10:34:59.581Z",
      "BetId": "0e0a5a17-64c0-48f9-a33e-f49a737932d2",
      "Channel": 0,
      "CurrencyCode": "CNY",
      "IPAddress": "127.0.0.1",
      "IPAddressV6": "",
      "OddsChangeType": 1,
      "OddsType": 0,
      "UserId": "none",
      "Stake": 10.01,
      "Selections": [
        {
          "FixtureSpecifier": "bg:match:123456",
          "MarketSpecificer": "",
          "Odds": 1.54,
          "MarketTemplateId": "1",
          "SelectionTemplateId": "1"
        }
      ]
    }
    """
    Then show me the response
    Then the response status should be "400"
    And the JSON response should have "$.statusCode" with the text "104"
    And the JSON response should have "$.message" with the text "Insufficient Funds"

  Scenario: Max Stake API
    Given I have platform API Key
    When I add the operator token
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a POST request to "/v2/bet/placement" with the following:
    """
    {
      "BetDate": "2025-12-01T10:34:59.581Z",
      "BetId": "0e0a5a17-64c0-48f9-a33e-f49a737932d2",
      "Channel": 0,
      "CurrencyCode": "CNY",
      "IPAddress": "127.0.0.1",
      "IPAddressV6": "",
      "OddsChangeType": 1,
      "OddsType": 0,
      "UserId": "none",
      "Stake": 10.01,
      "Selections": [
        {
          "FixtureSpecifier": "bg:match:123456",
          "MarketSpecificer": "",
          "Odds": 1.54,
          "MarketTemplateId": "1",
          "SelectionTemplateId": "1"
        }
      ]
    }
    """
    Then show me the response
    Then the response status should be "400"
    And the JSON response should have "$.statusCode" with the text "104"
    And the JSON response should have "$.message" with the text "Insufficient Funds"

  Scenario: Bet Config
    Given I have platform API Key
    When I add the operator token
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v1/bet/config" with the following:
    """
    currencyCode=1
    """
    Then show me the response
    # no fixture on test
    Then the response status should be "400"

  Scenario: Bet Status
    Given I have platform API Key
    When I add the operator token
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v1/bet/status" with the following:
    """
    BetId=6c97ec01-8c6d-46ac-a84e-548f004de204
    """
    Then show me the response
    # because I cannot bet to a fixture
    Then the response status should be "400"

  Scenario: Bet Recommendations Unsupported Currency
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/betrecommendations" with the following:
    """
    currencyCode=ZZZ
    """
    Then the response status should be "400"
    And the JSON response should have "$.statusCode" with the text "105"
    And the JSON response should have "$.message" with the text "Unsupported CurrencyCode"

  @failing
  Scenario: Bet Recommendations
    Given I have platform API Key
    When I add the operator token
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/betrecommendations" with the following:
    """
    currencyCode=EUR
    """
    Then show me the response
    Then the response status should be "200"

  @current
  Scenario: Logout the Operator Token
    Given I have platform API Key
    When I add the operator token
    When I use the test client id
    When I send and accept JSON
    When I send a POST request to "/v1/authentication/logout"
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"
