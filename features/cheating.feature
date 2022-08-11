Feature: gain access to the word without guessing it

    As a adversary playing Wordguesser
    So that I can see the word without ever entering a letter
    I want to navigate to a ending page and see the word

Scenario: navigate to lose page
  Given I start a new game with word "snake"
  When I try to go to the URL "/lose"
  Then I should be on the show page
  And the word should read "-----"

Scenario: navigate to win page
  Given I start a new game with word "snake"
  When I try to go to the URL "/win"
  Then I should be on the show page
  And the word should read "-----"
