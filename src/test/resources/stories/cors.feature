@skip @story-cors
Feature: 
  In order to reduce the risk of Cross Site Request Forgery
  As a system owner
  I want to verify that the application does not allow the browser to perform requests outside of the allowed origins
  
  Meta: @story cors @skip

  @cwe-942-cors @id-cors_successful_from_allowed_origins
  Scenario Outline: Permit allowed origins to make CORS requests
    Given a new browser or client instance
    And the client/browser is configured to use an intercepting proxy
    When the path <path> is requested with the HTTP method GET with the 'Origin' header set to <origin>
    Then the returned 'Access-Control-Allow-Origin' header has the value <origin>

    Examples: 
      | tables/allowed.cors.requests.table |

  @cwe-942-cors @id-cors_unsuccessful_from_disallowed_origins
  Scenario Outline: Forbid disallowed origins from making CORS requests
    Given a new browser or client instance
    And the client/browser is configured to use an intercepting proxy
    When the path <path> is requested with the HTTP method GET with the 'Origin' header set to <origin>
    Then the header 'Access-Control-Allow-Origin' header is not returned

    Examples: 
      | tables/disallowed.cors.requests.table |