Feature: game over

  As a player playing Wordguesser
  So I can get back to my life 
  I want to know when the game is over

Scenario: game over because I guess the word

  Given I start a new game with word "foobar"
  When I make the following guesses: f,o,b,a,r
  Then I should see "You Win!"

Scenario: game over because I run out of guesses

  Given I start a new game with word "zebra"
  When I make the following guesses: t,u,v,w,x,y
  And I guess "d"
  Then I should see "Sorry, you lose!"
