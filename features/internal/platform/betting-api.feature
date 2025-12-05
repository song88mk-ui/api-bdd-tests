@internal
@betting
Feature: Betting API - Betting
  As DevOps
  I want to make sure all the endpoints are working

  Scenario: Bet Placement
    When I send and accept JSON
    When I send a POST request to "/v1/bet/maxstake" with the following:
    """
    {
      "ClientId": "F5251362-64F1-4BF4-28E9-08D8EE99CA8E",
      "UserId": "nonexisting",
      "BetId": "dd5944ce-8b75-4380-9ffd-e10d8e55be33",
      "LimitId": ""
    }
    """
    Then the response status should be "400"
    And the JSON response should have "$.statusCode" with the text "1000"
    And the JSON response should have "$.message" with the text "Error - Missing LimitId"

  Scenario: Bet MaxStake
    When I send and accept JSON
    When I send a POST request to "/v1/bet/maxstake" with the following:
    """
    {
      "ClientId": "F5251362-64F1-4BF4-28E9-08D8EE99CA8E",
      "UserId": "nonexisting",
      "BetId": "dd5944ce-8b75-4380-9ffd-e10d8e55be33",
      "LimitId": ""
    }
    """
    Then the response status should be "400"
    And the JSON response should have "$.statusCode" with the text "1000"
    And the JSON response should have "$.message" with the text "Error - Missing LimitId"

  Scenario: Bet History
    When I send and accept JSON
    When I send a POST request to "/v1/bet/history/settled" with the following:
    """
    {
      "ClientId": "F5251362-64F1-4BF4-28E9-08D8EE99CA8E",
      "UserId": "nonexisting"
    }
    """
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: Bet History Settled
    When I send and accept JSON
    When I send a POST request to "/v1/bet/history/settled" with the following:
    """
    {
      "ClientId": "F5251362-64F1-4BF4-28E9-08D8EE99CA8E",
      "UserId": "nonexisting"
    }
    """
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: Bet History Running
    When I send and accept JSON
    When I send a POST request to "/v1/bet/history/running" with the following:
    """
    {
      "ClientId": "F5251362-64F1-4BF4-28E9-08D8EE99CA8E",
      "UserId": "nonexisting"
    }
    """
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: Bet Config
    When I send and accept JSON
    When I send a POST request to "/v1/bet/config" with the following:
    """
    {
      "ClientId": "F5251362-64F1-4BF4-28E9-08D8EE99CA8E",
      "CurrencyCode": "EUR",
      "ExchangeRate": 1.00,
      "CompanyShare": 0.09
    }
    """
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: Bet Cancellation
    When I send and accept JSON
    When I send a POST request to "/v1/bet/cancel" with the following:
    """
    {
      "BetIds": ["dd5944ce-8b75-4380-9ffd-e10d8e55be33"],
      "NewStatus": 7000,
      "Reason": "testing",
      "ModifiedByUserId": 0
    }
    """
    Then the response status should be "400"
    And the JSON response should have "$.statusCode" with the text "1000"
    And the JSON response should have "$.message" with the text "Error"
    And the JSON response should have "$.result.data[0].message" with the text "Bet ID not found"

  # not passing data, just checking endpoint
  Scenario: Manual Settlement
    When I send and accept JSON
    When I send a POST request to "/v1/bet/manualsettlement" with the following:
    """
    {
      "ModifiedByUserId": 0,
      "ManualBetRequest": []
    }
    """
    Then the response status should be "400"
    And the JSON response should have "$.statusCode" with the text "1000"
    And the JSON response should have "$.message" with the text "Error"

  Scenario: Bet Details
    When I send and accept JSON
    When I send a POST request to "/v1/bet/selections" with the following:
    """
    {
      "LanguageCode": "EN",
      "BetIds": ["dd5944ce-8b75-4380-9ffd-e10d8e55be33"]
    }
    """
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: Bet Selections
    When I send and accept JSON
    When I send a POST request to "/v1/bet/selections" with the following:
    """
    {
      "BetId": "dd5944ce-8b75-4380-9ffd-e10d8e55be33"
    }
    """
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"


  Scenario: Bet Resend Settlement
    When I send and accept JSON
    When I send a POST request to "/v1/bet/resendsettlement" with the following:
    """
    {
      "Messages": [
      {
        "BetId": "dd5944ce-8b75-4380-9ffd-e10d8e55be33",
        "MessageType": "",
        "Info": "",
        "CorrelationId": ""
      }
      ]
    }
    """
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.result.data[0].message" with the text "Success"

  Scenario: Get CashOut
    When I send and accept JSON
    When I send a POST request to "/v1/bet/cashout" with the following:
    """
    {
      "BetId": "dd5944ce-8b75-4380-9ffd-e10d8e55be33"
    }
    """
    Then the response status should be "400"
    And the JSON response should have "$.statusCode" with the text "141"
    And the JSON response should have "$.message" with the text "CashOut Is Unavailable"

  Scenario: Get CashOut State
    When I send and accept JSON
    When I send a POST request to "/v1/bet/cashout/state" with the following:
    """
    {
      "BetId": "dd5944ce-8b75-4380-9ffd-e10d8e55be33"
    }
    """
    Then the response status should be "400"
    And the JSON response should have "$.statusCode" with the text "141"
    And the JSON response should have "$.message" with the text "CashOut Is Unavailable"

  Scenario: Bet Status - Non Guid
    When I send and accept JSON
    When I send a POST request to "/v1/bet/status" with the following:
    """
    {
      "BetId": "unset"
    }
    """
    Then the response status should be "400"
    And the JSON response should have "$.status" with the text "400"
    And the JSON response should have "$.title" with the text "One or more validation errors occurred."

    @current
  # because bet is not found :D
  Scenario: Bet Status - Guid
    When I send and accept JSON
    When I send a POST request to "/v1/bet/status" with the following:
    """
    {
      "BetId": "dd5944ce-8b75-4380-9ffd-e10d8e55be33"
    }
    """
    Then show me the response
    Then the response status should be "400"
    And the JSON response should have "$.message" with the text "Object reference not set to an instance of an object."

  Scenario: Cache Preload
    When I send and accept JSON
    When I send a POST request to "/v1/cachepreload" with the following:
    """
    {
      "CacheKey": "unset",
      "CacheType": 0
    }
    """
    Then the response status should be "200"

  @current
  @failing
  # Requires the GetTopMarketBets Stored Proc
  Scenario: Bet Recommendation
    When I send and accept JSON
    And I send a POST request to "/v1/bet/recommendations" with the following:
    """
    {
      "ClientId": "F5251362-64F1-4BF4-28E9-08D8EE99CA8E",
      "ClientCode": "G01",
      "CurrencyCode": "EUR",
      "LanguageCode": 1
    }
    """
    Then show me the response
    Then the response status should be "200"
