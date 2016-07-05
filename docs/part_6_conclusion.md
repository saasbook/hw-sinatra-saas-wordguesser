
Conclusion
==========

This assignment has served as a microcosm or miniature tour of the
entire course: during the rest of the course we will investigate each of
these in much more detail, and we will also add new techniques---

* *Test-driven development (TDD)* will let you write much more
detailed tests for your code and determine its **coverage**, that is,
how thoroughly your tests exercise your code.  We will use **RSpec** to
do test-first development, in which we write tests before we write the
code, watch the test fail ("red"), quickly write just enough code to make the
test pass ("green"), clean up (refactor) the code, and go on to the next test.  We
will use the `autotest` tool to help us get into a rhythm of red--green--refactor.
In this assignment we provided the specs for you; when designing your
own app, you'll write them yourself.

* *Code metrics* will give us insight into the quality of our code: is
it concise?  Is it factored in a way that minimizes the cost of making
changes and enhancements?  Does a particular class try to do too much
(or too little)?  We will use **CodeClimate** (among other tools) to
help us understand the answers.  We can check both quantitative metrics,
such as test coverage and complexity of a single method, and qualitative
ones, such as adherence to the *SOLID Principles* of object-oriented
design.

* *Refactoring* means modifying the structure of your code to improve
its quality (maintainability, readability, modifiability) while
preserving its behavior.  We will learn to identify *antipatterns* --
warning signs of deteriorating quality in your code -- and opportunities
to fix them, sometimes by applying *design patterns* that have emerged
as "templates" capturing an effective solution to a class of similar
problems. 


Homework Submission
==========
IMPORTANT!!! The file that you will submit to the autograder MUST be ASCII encoded. If you do not know what this means then please create your text file in cloud9 using the `echo` command like this:
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
You would of course change 'my-app-12345' to match your heroku URL. Then right-click on the 'hw2.txt' file in the left side panel of cloud9 and choose 'Download'. Remember which folder you download this into so that you can browse for it on the homework submission page. It is usually your 'My Downloads' folder.

Lastly, visit the same URL that you put into the text file with your web browser to be sure that your app is running correctly at that address before submitting the text file.

-----

Next: [Optional Challenge Assignment](part_7_optional_challenge.md)  
