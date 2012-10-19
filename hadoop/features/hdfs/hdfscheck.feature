Feature: hdfs-test
  check if a newly create file can be found via the web frontend of hdfs

  Scenario: create an empty file on hdfs
    When I run 'ssh root@worker-204 "hadoop fs -touchz /tmp/cucumber-hdfs-test"'
    Then it should exit '0'

  Scenario: check the recently created file
    Given I navigate to dfs path "/" on "worker-203:50075"
    And I follow "tmp"
    Then the request should succeed
    And I should see "cucumber-hdfs-test"
    When I follow "cucumber-hdfs-test"
    Then the request should succeed
    And I should see "Empty file"

  Scenario: delete the file on hdfs and verify the deletion
    When I run 'ssh root@worker-202 "hadoop fs -rm /tmp/cucumber-hdfs-test"'
    Then it should exit '0'
    Given I navigate to dfs path "/" on "worker-203:50075"
    And I follow "tmp"
    Then the request should succeed
    And I should not see "cucumber-hdfs-test"
