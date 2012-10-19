Feature: check status of namenode storage directories

  Scenario: navigate to DFS-Home and check the status of any directory
    When I go to "http://namenode-server:50070/dfshealth.jsp"
    Then the request should succeed
    And the directories should be "Active"

