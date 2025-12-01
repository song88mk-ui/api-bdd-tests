@platformapi
Feature: Platform API
  As DevOps
  I want to make sure all the endpoints are working

  Scenario: Unauthenticated Sportstree
    When I send a GET request to "/v1/client/topfixtures/sportstree" with the following:
      | clientRefId | 0 |
    Then the response status should be "400"
    And the JSON response should have "$.statusCode" with the text "101"
    And the JSON response should have "$.message" with the text "Missing Or Unsupported APIKey In Request Headers"

  Scenario: Authenticated Sportstree using Internal API Key
    Given I have internal api key
    When I send a GET request to "/v1/client/topfixtures/sportstree" with the following:
      | clientRefId | 0 |
    Then the response status should be "200"

  Scenario: Get Top Leagues
    Given I have internal api key
    When I send a GET request to "/v1/client/topleagues" with the following:
      | ClientIdRefs | 12600 |
      | SportId      | 0     |
      | LanguageCode | EN    |
      | SegmentId    | 0     |
      | LeagueId     | 0     |
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"

  Scenario: Get Client Sports
    Given I have internal api key
    When I send a GET request to "/v1/client/sports" with the following:
      | LanguageCode | en |
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"


  Scenario: Get Client All Leagues with non existing ClientId
    Given I have internal api key
    When I send a GET request to "/v1/client/allleagues" with the following:
      | ClientIdRef  | 0  |
      | SportId      | 0  |
      | LanguageCode | en |
    Then the response status should be "400"
    And the JSON response should have "$.statusCode" with the text "102"
    And the JSON response should have "$.message" with the text "Missing Or Unsupported ClientId In Request Headers"


  Scenario: Get Client All Leagues with existing ClientId
    Given I have internal api key
    When I send a GET request to "/v1/client/allleagues" with the following:
      | ClientIdRef  | 12600 |
      | SportId      | 0     |
      | LanguageCode | en    |
    Then the response status should be "200"
    Then show me the response
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"


  Scenario: Get Exchange Rate for EUR
    Given I have internal api key
    When I send a GET request to "/v1/client/exchangerate" with the following:
      | currencyCode | EUR |
    Then the response status should be "200"
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"
    And the JSON response should have "$.result.currencyCode" with the text "EUR"
    And the JSON response should have "$.result.exchangeRate" with the text "1.0"
