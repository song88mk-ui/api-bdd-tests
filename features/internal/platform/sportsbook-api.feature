@internal
@sportsbook
Feature: Betting API
  As DevOps
  I want to make sure all the endpoints are working

  Scenario: Asian Clients
    When I send and accept JSON
    And I send a GET request to "/v1/sportsbook/client/asian"
    Then the response status should be "200"
    #Then show me the response
    And the JSON response should have "$.statusCode" with the text "100"
    And the JSON response should have "$.message" with the text "Success"


