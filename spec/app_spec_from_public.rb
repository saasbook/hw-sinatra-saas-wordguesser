require 'spec_helper'
require 'json'

describe "Hangperson" do
  describe "redirects -" do
    it "GET '/' should redirect to '/new'" do
      get '/'
      last_response.should be_redirect
      follow_redirect!
      last_request.url.should include('/new')
    end
  
    it "GET '/create' should redirect to '/show'" do
      post '/create'
      last_response.should be_redirect
      follow_redirect!
      last_request.url.should include('/show')
    end
  end

  describe "initialization" do
    it "should initialize session values" do
      stub_random_word('garply')
      post '/create'
      session[:word].should == 'garply'
      session[:guesses].should == ""
      session[:wrong_guesses].should == ""
    end
  end

  describe "word_with_guesses " do
    it "should be blank with no guesses" do
      @app = app
      @app.word_with_guesses('foobar', '').should == "------"
    end
    it "should fill in single correct guesses" do
      app.word_with_guesses('garply', 'g').should == "g-----"
      app.word_with_guesses('foobar', 'o').should == "-oo---"
      app.word_with_guesses('zebra', 'b').should == "--b--"
    end
    it "should completely fill in >1 guesses" do
      app.word_with_guesses('razmataz', 'zm').should == '--zm---z'
      app.word_with_guesses('hooplah', 'ohpal').should == 'hooplah'
    end
  end

  describe "guessing" do
    it "should increase wrong guesses when incorrect" do
      post '/guess', {:guess => 'a'}, "rack.session" => {:word => "xylophone", :guesses => "xy", :wrong_guesses => "t"}
      session[:wrong_guesses].should == 'ta'
    end
    it "should increase right guesses when correct" do
      #set_session("animal", "ai", "z")
      post '/guess', {:guess => 'n'}, "rack.session" => {:word => "animal", :guesses => "ai", :wrong_guesses => "z" }
      session[:guesses].should == "ain"
    end
    it "should not log the same correct guess twice" do
      post '/guess', {:guess => 'o'}, "rack.session" => {:word => 'foobar', :guesses => 'of', :wrong_guesses => 'xyz'}
      session[:guesses].should == 'of'
      session[:wrong_guesses].should == 'xyz'
    end
    it "should not log the same incorrect guess twice" do
      post '/guess', {:guess => 'y'}, "rack.session" => {:word => 'foobar', :guesses => 'of', :wrong_guesses => 'xyz'}
      session[:guesses].should == 'of'
      session[:wrong_guesses].should == 'xyz'
    end
  end

  describe "after game ends" do
    it "redirects to '/loss' when 7 wrong guesses are reached" do
      session = { "rack.session" => {:word => "tribulation", :guesses => "aibtorul", :wrong_guesses => "xyzwqpj"} }
      get '/show', {}, session
      last_response.should be_redirect
      follow_redirect!
      last_request.url.should include('/lose')
    end
    it "redirects to '/win' when the full word is guessed" do
      session = { "rack.session" => {:word => "tribulation", :guesses => "aibtnorul", :wrong_guesses => "xyzwqp"} }
      get '/show', {}, session
      last_response.should be_redirect
      follow_redirect!
      last_request.url.should include('/win')
    end
  end

end