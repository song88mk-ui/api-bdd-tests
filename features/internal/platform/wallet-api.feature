@internal
@wallet
Feature: Wallet API
  As DevOps
  I want to make sure all the endpoints are working

  Scenario: Get User Wallet
    When I send a GET request to "/v1/userwallet" with the following:
    """
    ClientId=f084d09d-bcc8-4d15-9d35-84d5ea634266&UserId=0
    """
    Then the response status should be "200"
    Then show me the response
