require 'sinatra/base'
require 'sinatra/flash'
require './lib/hangperson_game.rb'

class HangpersonApp < Sinatra::Base

  enable :sessions
  register Sinatra::Flash
  
  before do
    # code that is called before EVERY HTTP request
  end
  
  after do
    # code that is called after EVERY HTTP request
  end
  
  get '/' do
    redirect '/new'
  end
  
  get '/new' do
    erb :new
  end
  
  post '/create' do
    # Don't change next line: it's necessary for autograder to work properly.
    word = params[:word] || HangpersonGame.get_random_word # don't change this line!
    # Don't change the above line: it's necessary for autograder to work properly.
    # Your additional code goes here:

  end
  
  post '/guess' do
    # get the guessed letter from params[:guess] (note: if user left it blank,
    #   params[:guess] will be nil)

    # Try guessing the letter.  If it has already been guessed,
    #   display "You have already used that letter."

    # Either way, the user should then be shown the main game screen ('show' action).

  end
  
  get '/show' do
    # To show the game status, use the check_win_or_lose function.
    # If player wins (word completed), do the 'win' action instead.
    # If player loses (all guesses used), do the 'lose' action instead.
    # Otherwise, show the contents of the 'show.erb' (main game view) template.

  end
  
  get '/win' do
    # Player wins. WARNING: prevent cheating by making sure the game has really been won!
    #  If player tries to cheat, they should be shown the main game view instead.  (And
    #  you can optionally supply a "No cheating!" messaage.)
    # If they really did win, show the 'win' view template.
    
  end
  
  get '/lose' do
    # Player loses. WARNING: make sure the game has really been lost!
    # If they really did lose, show the 'win' view template.
    # Otherwise, show the main game view instead.

    if @game.check_win_or_lose == :lose
      erb :lose
    else
      redirect '/show'
    end
  end
  
end
