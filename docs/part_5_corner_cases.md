
Part 5: Corner Cases
====================

By now you should be familiar with the cycle:

1.  Pick a new scenario to work on (you should have 2/4 working at this point)
2.  Run the scenario and watch it fail
3.  Develop code that makes each step of the scenario pass
4.  Repeat till all steps passing.

Use this process to develop the code for the remaining actions `win` and `lose`.  You will need to add code to the `show` action that checks whether the game state it is about to show is actually a winning or losing state, and if so, it should redirect to the appropriate `win` or `lose` action.  Recall that your game logic model has a method for testing if the current game state is win, lose, or keep playing. The scenario `game_over.feature` tests these behaviors in your SaaS app.

Push to Heroku and make sure everything still works.  Give yourself a break and play a few rounds of hangperson.

While you're playing, what happens if you directly add `/win` to the end of your app's URL?  Make sure the player cannot cheat by simply visiting `GET /win`.  Consider how to modify the actions for `win`, `lose`, and `show` to prevent this behavior.

* What to submit:  Make sure all Cucumber scenarios are passing.  A shorthand way to run all of them is `cucumber features/` which runs all `.feature` files in the given directory.

Submission Instructions
-----------------------
When all scenarios are passing, deploy to Heroku and submit the URL of your deployed game. **Note:** Make sure the Heroku URL does not begin with `https` or with `http`, or you may get a socket error message. For example, if your app name on heroku is 'dragon-4582', then the proper Heroku URL would be 'dragon-4582.herokuapp.com' with nothing else.

IMPORTANT!!! The file that you will submit to the autograder MUST be ASCII encoded. If you do not know what this means then please create your text file using the `echo` command like this:

```
echo 'my-app-12345.herokuapp.com' > hw2.txt
```

Note that the auto-grader expects the URL to be of a specific form - the URL in the text file should contain neither http:// nor https://. If you run the `cat` command after creating the file like this:

```
cat hw2.txt
```

then the output should look like this:

```
my-app-12345.herokuapp.com
```

You would of course change 'my-app-12345' to match your heroku URL.

If you're using Cloud9, right-click on the 'hw2.txt' file in the left side panel of Cloud9 and choose 'Download'. Remember which folder you download this into so that you can browse for it on the homework submission page. It is usually your 'My Downloads' folder.

Lastly, visit the same URL that you put into the text file with your web browser to be sure that your app is running correctly at that address before submitting the text file.

-----

Next: [Conclusion](part_6_conclusion.md)
