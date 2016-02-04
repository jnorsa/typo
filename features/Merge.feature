Feature: Edit Category
  As a blog administrator
  I should be able to create/edit category

  Scenario: Access Merge functionaltiy
    Given the blog is set up
    And I am logged into the admin panel
    And I am on the new article page
    Then I should see "Merge Article"
    
  Scenario: Non-access to merge functionality
    Given the blog is set up
    And I am logged as publisher into the admin panel
    And I am on the new article page
    Then I should not see "Merge Article"
    
  Scenario: Merge Article - keep old author
    Given the blog is set up
    And I am logged into the admin panel
    And I am on the new article page
    When I fill in "mergeID" with "1"
    And I fill in "article_title" with "Foobar"
    And I fill in "article__body_and_extended_editor" with "Lorem Ipsum"
    And I press "Merge"
    Then I should be on the admin content page
    And I should see "admin"

  Scenario: Merge Article - keep merge content
    Given the blog is set up
    And I am logged into the admin panel
    And I am on the new article page
    When I fill in "mergeID" with "1"
    And I fill in "article_title" with "Foobar"
    And I fill in "article__body_and_extended_editor" with "Lorem Ipsum"
    And I press "Merge"
    And I press "edit"
    Then I should be on the new article page
    And I should see "Lorem Ipsum"
    And I should see "Welcome to Typo. This is your first article. Edit or delete it, then start blogging!"