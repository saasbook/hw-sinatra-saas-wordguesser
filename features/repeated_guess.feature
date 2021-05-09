Feature: guess repeated letter

  As a player playing Hangperson
  So that I can avoid wasting guesses on letters I've already tried
  I want to be informed when I guess a letter I've already tried

Scenario: guess correct letter that I have already tried

  Given I start a new game with word "bumblebee"
  When I guess "b"
  And I guess "b" again
  Then the word should read "b--b--b--"
  And I should see "You have already used that letter"

Scenario: guess incorrect letter that I have already tried

  Given I start a new game with word "giraffe"
  When I guess "z"
  And I guess "z" again
  Then the word should read "-------"
  And I should see "You have already used that letter"

Scenario: guessing an incorrect letter does not count towards guesses

  Given I start a new game with word "snake"
  When I guess "z" 30 times in a row
  Then I should be on the show page
