@external
@platformapi
@sportsbook
Feature: Platform Integration API - Sportsbook
  As DevOps
  I want to make sure all the endpoints are working

  Scenario: Livestream
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
      | x-operator-token | none |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/livestream" with the following:
    """
    ProviderFixtureId=bg:match:12345&IPAddress=1.2.3.4&IsMobile=true
    """
    Then show me the response
    Then the response status should be "200"

  Scenario: Top Leagues
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
      | x-operator-token | none |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/sports/topleagues" with the following:
    """
    SportId=1&FixtureStatusGroup=1&MinuteUTCOffset=0
    """
    Then the response status should be "200"

  Scenario: All Leagues
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
      | x-operator-token | none |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/sports/allleagues" with the following:
    """
    SportId=1&FixtureStatusGroup=1&MinuteUTCOffset=0
    """
    Then the response status should be "200"

  Scenario: Top Fixtures FixtureId
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
      | x-operator-token | none |
    When I send and accept JSON
    When I send a GET request to "/v2/sportsbook/topfixtures/fixtureId"
    Then the response status should be "200"

  Scenario: Market Template Groups
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
      | x-operator-token | none |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/markettemplategroups"
    Then the response status should be "200"

  Scenario: Selector Market Template
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
      | x-operator-token | none |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/selectormarkettemplates"
    Then the response status should be "200"

  Scenario: Market Sort Order
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
      | x-operator-token | none |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/marketsortorder"
    Then the response status should be "200"

  Scenario: Fixture Sort Order
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
      | x-operator-token | none |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/fixturesortorder"
    Then the response status should be "200"

  Scenario: User Favorites
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
      | x-operator-token | none |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/userfavorites/fixtures"
    Then the response status should be "200"

  Scenario: Top Fixtures
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
      | x-operator-token | none |
    When I send and accept JSON
    When I send a GET request to "/v2/sportsbook/topfixtures"
    Then the response status should be "200"

  Scenario: Active Fixtures
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
      | x-operator-token | none |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/activefixtures" with the following:
    """
      ParticipantName=who&FixtureStatus=unset
      """
    Then the response status should be "200"

  Scenario: Active Fixtures Details
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
      | x-operator-token | none |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/activefixtures/details" with the following:
    """
      FixtureId=fixtureId
    """
    Then the response status should be "200"

  Scenario: Live Fixture Count
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/livefixturecount" with the following:
    """
    SportGroupId=1
    """
    Then the response status should be "200"

  Scenario: Today Fixture Count
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/todayfixturecount" with the following:
    """
    SportGroupId=1
    """
    Then the response status should be "200"

  Scenario: Get Live Fixtures
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/sports/livefixtures" with the following:
    """
    sportId=1
    """
    Then the response status should be "200"

  Scenario: Get Live Fixtures
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/sports/segments/leagues/livefixtures" with the following:
    """
    sportId=1&segmentId=0&leagueId=0
    """
    Then the response status should be "200"

  Scenario: Get Today Fixtures
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/sports/todayfixtures" with the following:
    """
    sportId=1&minuteUTCOffset=0
    """
    Then the response status should be "200"

  Scenario: Get Today Fixtures By League
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/sports/segments/leagues/todayfixtures" with the following:
    """
    sportId=1&segmentId=0&leagueId=0&minuteUTCOffset=0
    """
    Then the response status should be "200"

  Scenario: Upcoming Fixtures
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/sports/upcomingfixtures" with the following:
    """
    sportId=1&minuteUTCOffset=0
    """
    Then the response status should be "200"

  Scenario: Upcoming Fixtures By League
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/sports/segments/leagues/upcomingfixtures" with the following:
    """
    sportId=1&minuteUTCOffset=0&leagueId=0&segmentId=0
    """
    Then the response status should be "200"

  Scenario: Daily Fixtures
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/sports/dailyfixtures" with the following:
    """
    sportId=1&dateUTC=2025-12-01&minuteUTCOffset=0
    """
    Then the response status should be "200"

# Most endpoints are True Wave Endpoints :P

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

  Scenario: Bet Recommendations
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/betrecommendations" with the following:
    """
    currencyCode=USDT
    """
    Then show me the response
    Then the response status should be "200"

  Scenario: Announcements
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/announcements"
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: CCF Customer Confidence Factor
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/ccf" with the following:
    """
      UserId=missing
    """
    Then the response status should be "200"
