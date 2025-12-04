@external
@platformapi
@betting
Feature: Platform Integration API - Betting
  As DevOps
  I want to make sure all the endpoints are working

  Scenario: Get Balance
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
      | x-operator-token | unset |
    When I send and accept JSON
    When I send a GET request to "/v1/wallet/balance"
    Then show me the response
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "101"

  Scenario: Bet Placement
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
      | x-operator-token | none |
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
    Then the response status should be "200"
    Then show me the response

  Scenario: Max Stake API
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
      | x-operator-token | none |
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
    Then the response status should be "200"

  Scenario: Bet Config
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
      | x-operator-token | none |
    When I send and accept JSON
    When I send a GET request to "/v1/bet/config" with the following:
    """
    CurrencyCode=CNY
    """
    Then show me the response
    Then the response status should be "200"

  Scenario: Bet Status
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
      | x-operator-token | none |
    When I send and accept JSON
    When I send a GET request to "/v1/bet/status" with the following:
    """
    BetId=6c97ec01-8c6d-46ac-a84e-548f004de204
    """
    Then show me the response
    Then the response status should be "200"
