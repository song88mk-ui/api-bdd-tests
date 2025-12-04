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

  Scenario: Market Sort Order
    When I send and accept JSON
    And I send a POST request to "/v1/sportsbook/marketsortorder" with the following:
    """
    {
      "ClientId": "F5251362-64F1-4BF4-28E9-08D8EE99CA8E"
    }
    """
    Then the response status should be "200"
    And the JSON response should have "$.message" with the text "Success"

  @failing
  Scenario: Active Fixtures
    When I send and accept JSON
    When I send a POST request to "/v1/sportsbook/activefixtures" with the following:
    """
    {
      "ClientId": "F5251362-64F1-4BF4-28E9-08D8EE99CA8E",
      "ClientCode": "G01",
      "LanguageCode": 1,
      "IPCountryCode": "PH",
      "ParticipantName": "unset",
      "FixtureStatus": "live"
    }
    """
    Then show me the response
    Then the response status should be "200"

  @failing
  Scenario: Active Fixture Details
    When I send and accept JSON
    When I send a POST request to "/v2/sportsbook/fixtures/details/limited" with the following:
    """
    {
      "FixtureId": "1437404267307610112",
      "ClientId": "F5251362-64F1-4BF4-28E9-08D8EE99CA8E",
      "ClientCode": "G01",
      "LanguageCode": 1,
      "IPCountryCode": "PH"
    }
    """
    Then show me the response
    Then the response status should be "200"

  Scenario: Live Fixture Count
    When I send and accept JSON
    When I send a POST request to "/v2/sportsbook/livefixturecount" with the following:
    """
    {
      "ClientId": "F5251362-64F1-4BF4-28E9-08D8EE99CA8E",
      "SportId": 1,
      "ClientCode": "G01",
      "LanguageCode": 1,
      "IPCountryCode": "PH"
    }
    """
    Then the response status should be "200"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: Today Fixture Count
    When I send and accept JSON
    When I send a POST request to "/v2/sportsbook/todayfixturecount" with the following:
    """
    {
      "MinuteUTCOffset": 0,
      "ClientId": "F5251362-64F1-4BF4-28E9-08D8EE99CA8E",
      "LanguageCode": 1,
      "ClientCode": "G01",
      "SportGroupid": 0
    }
    """
    Then the response status should be "200"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: Daily Fixtures
    When I send and accept JSON
    When I send a POST request to "/v2/sportsbook/dailyfixtures" with the following:
    """
    {
      "MinuteUTCOffset": 0,
      "DateUTC": "2025-12-01",
      "SportId": 1,
      "ClientId": "F5251362-64F1-4BF4-28E9-08D8EE99CA8E",
      "LanguageCode": 1,
      "ClientCode": "G01",
      "IpCountryCode": "PH"
    }
    """
    Then the response status should be "200"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: Bet Recommendations
    When I send and accept JSON
    When I send a POST request to "/v2/sportsbook/betrecommendations" with the following:
    """
    {
      "ClientId": "F5251362-64F1-4BF4-28E9-08D8EE99CA8E",
      "ClientCode": "G01",
      "CurrencyCode": "EUR",
      "LanguageCode": 1,
      "Markets": []
    }
    """
    Then the response status should be "200"
    And the JSON response should have "$.message" with the text "Success"


  @current
  @failing
  Scenario: Get Sports (all)
    When I send and accept JSON
    When I send a POST request to "/v2/sportsbook/sports" with the following:
    """
    {
      "ClientId": "F5251362-64F1-4BF4-28E9-08D8EE99CA8E",
      "LanguageCode": 1,
      "ClientCode": "G01",
      "SportGroup": 0,
      "MinuteUTCOffset": 300
    }
    """
    Then show me the response
    Then the response status should be "200"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: Boosted Fixtures
    When I send and accept JSON
    When I send a POST request to "/v1/sportsbook/boostedfixtures" with the following:
    """
    {
      "ClientId": "F5251362-64F1-4BF4-28E9-08D8EE99CA8E",
      "ClientCode": "G01",
      "LanguageCode": 1,
      "IpCountryCode": "CN"
    }
    """
    Then show me the response
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: Get Translations By Language Code
    When I send and accept JSON
    When I send a POST request to "/v1/sportsbook/translations" with the following:
    """
    {
      "LanguageCode": 1
    }
    """
    Then show me the response
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"
