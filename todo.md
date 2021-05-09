hangperson_game.rb
------------------

A) concerned about use of attr_accessor
  1) how big a deal is it anyway? - principle of least power(?)
    - or is the key the encapsulation of state?
      encourages tight coupling of objects --> should prefer loose coupling
  2) design issues in the code, design issues in the tests
    - should we leave these until we've checked the current code works with 2.4?
  
B) concerned about downcase! on incoming parameter - should maybe not change
   and create new local parameter
  
C) should the engine be sanitising the input?

D) create a separate Letter class to take on those responsibilities

E) win vs lost instead win vs lose

hangperson_game_spec.rb
-----------------------

isn't attr_accessor a code smell (is this so?)
multiple expects per it block?
do we need to check instance type? (not rubyish)
  
problems with tests
A) concerned about the presence multiple `expects`
B) current tests are more integrations tests, and smaller
   units tests could promote better desgn
C) ivars being used (e.g. @game) should use minimal scope 
    --> should prefer lets and subjects
D) call @game GARPLYgame so we remember the word itself

Cucumber
--------

Confused about whether to use the existing win.erb or do something 

* optional "I" in the regex is maybe just confusing (Ryder)


app.rb
------

* @game.new_guess?
* @game.is_new?(guess)

* hash lookup from state to redirect

* do we need more cucumber tests?
    
* getting all the following even with all cukes passing

```
    
 1) Hangperson invalid guess should label a non-letter as invalid [5 points]
     Failure/Error:
       page.form_with(:action => '/guess') do |f|
         f.field_with(:name => 'guess').value = letter
       end.click_button

     Mechanize::ResponseCodeError:
       500 => Net::HTTPInternalServerError for http://ruby-2-4-hangperson.herokuapp.com/guess -- unhandled response

  2) Hangperson invalid guess should label a blank form as invalid [5 points]
     Failure/Error:
       page.form_with(:action => '/guess') do |f|
         f.field_with(:name => 'guess').value = letter
       end.click_button

     Mechanize::ResponseCodeError:
       500 => Net::HTTPInternalServerError for http://ruby-2-4-hangperson.herokuapp.com/guess -- unhandled response

  3) Hangperson cheating should not be able to fake a win [5 points]
     Failure/Error: expect(current_route).to eq("/show")

       expected: "/show"
            got: "/win"

       (compared using ==)

  4) Hangperson cheating should not be able to fake a loss [5 points]
     Failure/Error: expect(current_route).to eq("/show")

       expected: "/show"
            got: "/lose"

       (compared using ==)

1 deprecation warning total
```
