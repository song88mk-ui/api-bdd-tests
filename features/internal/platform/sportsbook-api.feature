@internal
@sportsbook
Feature: Betting API
  As DevOps
  I want to make sure all the endpoints are working

  Scenario: Livestream
    When I send and accept JSON
    When I send a POST request to "/v1/sportsbook/livestream" with the following:
    """
    {
      "ProviderFixtureId": "100001",
      "IPAddress": "127.0.0.1",
      "IPCountryCode": "US",
      "IsMobile": false
    }
    """
    Then the response status should be "400"
    And the JSON response should have "$.statusCode" with the text "123"
    And the JSON response should have "$.message" with the text "Fixture Has No Livestream"

  Scenario: Top Leagues
    When I send and accept JSON
    When I send a POST request to "/v1/sportsbook/topleagues" with the following:
    """
    {
      "ClientId": "F5251362-64F1-4BF4-28E9-08D8EE99CA8E",
      "ClientCode": "G01",
      "LanguageCode": 1,
      "SportId": 0
    }
    """
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: All Leagues v1
    When I send and accept JSON
    When I send a POST request to "/v1/sportsbook/allleagues" with the following:
    """
    {
      "ClientId": "F5251362-64F1-4BF4-28E9-08D8EE99CA8E",
      "ClientCode": "G01",
      "LanguageCode": 1,
      "SportId": 0
    }
    """
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: All Leagues v2
    When I send and accept JSON
    When I send a POST request to "/v2/sportsbook/allleagues" with the following:
    """
    {
      "ClientId": "F5251362-64F1-4BF4-28E9-08D8EE99CA8E",
      "ClientCode": "G01",
      "LanguageCode": 1,
      "SportId": 0,
      "LeagueId": 0,
      "SegmentId": 0
    }
    """
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: Top Fixtures
    When I send and accept JSON
    When I send a POST request to "/v1/sportsbook/topfixtures" with the following:
    """
    {
      "ClientId": "F5251362-64F1-4BF4-28E9-08D8EE99CA8E",
      "ClientCode": "G01",
      "LanguageCode": 1
    }
    """
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"


  Scenario: Asian Clients - Clients without Margin
    When I send and accept JSON
    And I send a GET request to "/v1/sportsbook/client/asian"
    Then the response status should be "200"
    #Then show me the response
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: Announcements
    When I send and accept JSON
    When I send a POST request to "/v1/sportsbook/announcements" with the following:
    """
      {
      "ClientId": "F5251362-64F1-4BF4-28E9-08D8EE99CA8E",
      "ClientCode": "G01",
      "LanguageCode": 1
      }
    """
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"
