@external
@platformapi
@sportsbook
Feature: Platform Integration API - Sportsbook
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

  #todo: add fixture id to test
  Scenario: Livestream
    Given I have platform API Key
    When I add the operator token
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/livestream" with the following:
    #Examples
      | providerFixtureId | bg:match:12345 |
      | ipAddress         | 1.2.3.4        |
      | isMobile          | true           |
    Then show me the response
    Then the response status should be "400"

  Scenario: Top Leagues (All)
    Given I have platform API Key
    When I add the operator token
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/sports/topleagues" with the following:
    #Examples
      | sportId            | 0   |
      | fixtureStatusGroup | 0   |
      | minuteUTCOffset    | 300 |
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: Top Leagues (Prematch)
    Given I have platform API Key
    When I add the operator token
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/sports/topleagues" with the following:
    #Examples
      | sportId            | 0   |
      | fixtureStatusGroup | 1   |
      | minuteUTCOffset    | 300 |
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: Top Leagues (Live)
    Given I have platform API Key
    When I add the operator token
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/sports/topleagues" with the following:
    #Examples
      | sportId            | 0   |
      | fixtureStatusGroup | 2   |
      | minuteUTCOffset    | 300 |
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: All Leagues
    Given I have platform API Key
    When I add the operator token
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/sports/allleagues" with the following:
    #Examples
      | sportId            | 0   |
      | fixtureStatusGroup | 0   |
      | minuteUTCOffset    | 300 |
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: Top Fixtures FixtureId
    Given I have platform API Key
    When I add the operator token
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v2/sportsbook/topfixtures/fixtureId"
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: Market Template Groups
    Given I have platform API Key
    When I add the operator token
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/markettemplategroups"
    Then the response status should be "200"
    Then show me the response
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: Selector Market Template
    Given I have platform API Key
    When I add the operator token
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/selectormarkettemplates"
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: Market Sort Order
    Given I have platform API Key
    When I add the operator token
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/marketsortorder"
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: Fixture Sort Order
    Given I have platform API Key
    When I add the operator token
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/fixturesortorder"
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: User Favorites
    Given I have platform API Key
    When I add the operator token
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/userfavorites/fixtures"
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: Top Fixtures
    Given I have platform API Key
    When I add the operator token
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v2/sportsbook/topfixtures"
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  # translation issue
  Scenario: Active Fixtures
    Given I have platform API Key
    When I add the operator token
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/activefixtures" with the following:
    #Examples
      | participantName | devops |
      | fixtureStatus   | live   |
    Then show me the response
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: Active Fixtures Details
    Given I have platform API Key
    When I add the operator token
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/activefixtures/details" with the following:
    #Examples
      | fixtureId | 1437404267307610112 |
    Then the response status should be "200"
    Then show me the response

  Scenario: Live Fixture Count
    Given I have platform API Key
    When I set headers:
      | X-Client-Id     | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/livefixturecount" with the following:
    #Examples
      | sportGroupId | 0 |
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: Today Fixture Count
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/todayfixturecount" with the following:
    #Examples
      | sportGroupId | 0 |
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: Get Sports
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/sports" with the following:
    #Examples
      | sportGroup      | 0   |
      | minuteUTCOffset | 300 |
    Then show me the response
    Then the response status should be "200"

    @current
  Scenario: Get Live Fixtures
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/sports/livefixtures" with the following:
    #Examples
      | sportId | 1 |
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: Get Live Fixtures
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/sports/segments/leagues/livefixtures" with the following:
    #Examples
      | sportId   | 1 |
      | segmentId | 0 |
      | leageId   | 0 |
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: Get Today Fixtures
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/sports/todayfixtures" with the following:
    #Examples
      | sportId         | 1   |
      | minuteUTCOffset | 300 |
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: Get Today Fixtures By League
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/sports/segments/leagues/todayfixtures" with the following:
    #Examples
      | sportId         | 1   |
      | segmentId       | 0   |
      | minuteUTCOffset | 300 |
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: Upcoming Fixtures
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/sports/upcomingfixtures" with the following:
    #Examples
      | sportId         | 1   |
      | minuteUTCOffset | 300 |
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: Upcoming Fixtures By League
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/sports/segments/leagues/upcomingfixtures" with the following:
    #Examples
      | sportId         | 1   |
      | minuteUTCOffset | 300 |
      | leagueId        | 0   |
      | segmentId       | 0   |
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: Daily Fixtures
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/sports/dailyfixtures" with the following:
    #Examples
      | sportId         | 1          |
      | dateUTC         | 2025-12-04 |
      | minuteUTCOffset | 300        |
    Then show me the response
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  # Most endpoints are True Wave Endpoints :P
  Scenario: Announcements
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/announcements"
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: CCF
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/ccf" with the following:
    #Examples:
      | userId | 3546c6d2-a83b-47c5-8a37-c1e2111543b5 |
    Then show me the response
    Then the response status should be "200"

  Scenario: Boosted Odds
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/boostedfixtures"
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: Translations
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/translations"
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  # sb bet recommendation
  Scenario: Bet Recommendations Unsupported Currency
    Given I have platform API Key
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/betrecommendations" with the following:
    #Examples:
      | currencyCode | NA |
    Then the response status should be "400"
    And the JSON response should have "$.statusCode" with the text "105"
    And the JSON response should have "$.message" with the text "Unsupported CurrencyCode"

  @failing
  @current
  Scenario: Bet Recommendations
    Given I have platform API Key
    When I add the operator token
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a GET request to "/v1/sportsbook/betrecommendations" with the following:
    #Examples:
      | currencyCode | EUR |
    Then show me the response
    Then the response status should be "200"

  @current
  Scenario: Logout the Operator Token
    Given I have platform API Key
    When I add the operator token
    When I set headers:
      | X-Client-Id | F5251362-64F1-4BF4-28E9-08D8EE99CA8E |
    When I send and accept JSON
    When I send a POST request to "/v1/authentication/logout"
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"
