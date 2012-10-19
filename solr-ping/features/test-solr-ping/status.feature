Feature: test solr ping
  It should be up
  And I should be able to search something

  Scenario: Visiting home page
    When I go to "http://your-solr-server:8080/solr/admin/ping"
    Then the status should show "OK"
    
