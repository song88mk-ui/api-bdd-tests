@oddsfeed
@oddsfeed-client-api
Feature: OddsFeed Client API
  As DevOps
  I want to make sure all the endpoints are working

  Scenario: Unauthenticated Request to livestream
    When I send a GET request to "/v1/livestream/0" with the following:
    Then the response status should be "400"
    And the JSON response should have "$.statusCode" with the text "101"
    And the JSON response should have "$.message" with the text "Missing Or Unsupported APIKey In Request Headers"

  Scenario: Authenticated Request to livestream
    Given I have oddsfeed API Key
    When I send a GET request to "/v1/livestream/0" with the following:
    Then the response status should be "400"
    And the JSON response should have "$.statusCode" with the text "101"
    And the JSON response should have "$.message" with the text "Missing Or Unsupported APIKey In Request Headers"

  # bet placement
  # bet caencel
  # odds recovery
  # settlement recovery
