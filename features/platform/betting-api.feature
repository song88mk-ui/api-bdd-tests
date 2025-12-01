@betting
Feature: Betting API
  As DevOps
  I want to make sure all the endpoints are working

  Scenario: Bet Recommendation
    When I send and accept JSON
    And I send a POST request to "/v1/bet/recommendations" with the following:
    #Examples:
      | ClientId     | f084d09d-bcc8-4d15-9d35-84d5ea634266 |
      | ClientCode   | S88                                  |
      | CurrencyCode | USD                                  |
      | LanugageCode | 0                                    |

    Then the response status should be "200"


  Scenario: Cache Preload
    When I send and accept JSON
    When I send a POST request to "/v1/cachepreload" with the following:
    #Examples:
      | CacheType | 0    |
      | CacheKey  | test |

    Then the response status should be "200"
