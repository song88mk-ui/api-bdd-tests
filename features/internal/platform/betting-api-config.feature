@internal
@betting
Feature: Betting API - Config Client
  As DevOps
  I want to make sure all the endpoints are working

  Scenario: Process BackOffice Client Bet Config
    When I send and accept JSON
    And I send a POST request to "/v1/config/client" with the following:
    """
    {
      "ClientId": "F5251362-64F1-4BF4-28E9-08D8EE99CA8E",
      "BetConfigPayload": []
    }
    """
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: Process BackOffice Client Parlay Bonus
    When I send and accept JSON
    And I send a POST request to "/v1/config/parlaybonus" with the following:
    """
    {
      "ClientIdRef": 12800,
      "ClientId": "F5251362-64F1-4BF4-28E9-08D8EE99CA8E",
      "ParlayBonusMinOdds": 0,
      "ParlayBonusConfig": []
    }
    """
    Then show me the response
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: Get Client Parlay Bonus
    When I send and accept JSON
    And I send a POST request to "/v1/config/parlaybonus/list" with the following:
    """
    {
      "ClientIdRef": 12800,
      "ClientId": "F5251362-64F1-4BF4-28E9-08D8EE99CA8E",
      "SelectionCount": 0
    }
    """
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"
