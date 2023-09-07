Feature: guess invalid inputs
  As a player playing Wordguesser
  So that I can try and break the app
  I want to see when my guess is invalid

# if your app is crashing then you might have to rescue it ;). Errors are good, so is catching them
# https://docs.ruby-lang.org/en/2.4.0/syntax/exceptions_rdoc.html
Scenario: guess an empty guess
  Given I start a new game with word "snake"
  When I guess ""
  Then the server should not respond with status 500
  And the server should respond with status 200
  And I should see "Invalid guess."

Scenario: guess a noncharacter guess
  Given I start a new game with word "snake"
  When I guess "@"
  Then the server should not respond with status 500
  And the server should respond with status 200
  And I should see "Invalid guess."
