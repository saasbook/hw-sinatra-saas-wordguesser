Wordguesser: a scaffolded (!) ESaaS getting-started assignment
=============================================================

(v1.1, September 2015.  Written by Armando Fox and Nick Herson)
(some edits by mverdicchio 21 September 2015)
(refinements by Armando Fox September 2017)

In this assignment you'll be introduced to part of the basic cycle of creating SaaS in a disciplined way.

**NOTE: Do not clone this repo to your workspace. Fork it first, then clone your fork.**



Learning Goals
--------------
After completing this assignment, you will be able to:

* Create and deploy simple SaaS apps in your development environment, and deploy them to the public cloud
* Practice the basic workflow of test-driven development (TDD), in which tests are written before the code (so they fail when first run) and code is then added to make them pass
* Understand how SaaS frameworks such as Sinatra support the conceptual components of a three-tier SaaS application architecture
* Understand the challenges of adapting a non-SaaS application to a SaaS environment, including how to identify and manage application state
* Understand one use case of service-oriented architecture, in which your SaaS app relies on an external service's API (application programming interface) to provide part of the SaaS app's functionality.

Prerequisites
-------------
* You should be familiar with Ruby basics, for example by completing the Ruby Intro or Ruby Calisthenics assignment.
* You should have read [ESaaS](http://www.saasbook.info) Chapter 2, "The Architecture of SaaS Applications", and watched the accompanying videos in the [MOOC](http://www.saas-class.org).
* You should be comfortable with basic Git usage and how to push your code to GitHub, as described in Appendix A of [ESaaS](http://www.saasbook.info).
* You will need "survival level" Unix command-line skills and facility with an editor to edit code files.

**NOTE: You may find the [Sinatra documentation](https://sinatrarb.com) helpful to have on hand.**

Introduction
------------
The full Agile/XP cycle we follow in ESaaS includes talking to the customer, using BDD to develop scenarios, turning those scenarios into runnable integration/acceptance tests with Cucumber, using those scenarios plus TDD to drive the creation of actual code, and deploying the result of each iteration's work to the cloud.

In this introductory assignment, we've provided RSpec unit tests to let you use TDD to develop game logic for a word-guessing game.  In the full Agile/XP cycle, you'd develop these tests yourself as you code.

You'll then use the Sinatra framework to make the Wordguesser game available as SaaS. Adapting the game logic for SaaS will introduce you to thinking about RESTful routes and service-oriented architecture. As you develop the "SaaS-ified" Wordguessing game, you'll use Cucumber to describe how gameplay will work from the player's point of view and as "full stack" integration tests that will drive SaaS development.  In the full Agile/XP cycle, you'd develop Cucumber scenarios yourself based on consultation with the customer, and create the necessary *step definitions* (Cucumber code that turns plain-English scenarios into runnable tests).  In this assignment we provide both the scenarios and step definitions for you.

You'll deploy your game to the cloud using Heroku, giving you experience in automating SaaS deployment.

**Why Sinatra?** 

This assignment uses the simple [Sinatra](https://github.com/sinatra/sinatra) framework rather than Rails, so that you can focus on tools, mechanics, and SaaS concepts, all of which will readily map to Rails later.  Since our app doesn't have a database and has very few functions, Sinatra is an easy way to get started.

Contents
---------

* Part 0: [Demystifying SaaS app creation](docs/part_0_create_saas_app.md)
* Part 1: [Wordguesser](docs/part_1_wordguesser.md)
* Part 2: [RESTful thinking for Wordguesser](docs/part_2_restful_thinking.md)
* Part 3: [Connecting WordGuesserGame to Sinatra](docs/part_3_connecting_wordguesser_to_sinatra.md)
* Part 4: [Introducing Cucumber](docs/part_4_cucumber.md)
* Part 5: [Corner Cases](docs/part_5_corner_cases.md)
* Part 6: [Conclusion](docs/part_6_conclusion.md)
* Part 7: [Optional Challenge Assignment](docs/part_7_optional_challenge.md)
