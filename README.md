[![Build Status](https://travis-ci.org/CraftAcademy/quizmaster.svg?branch=develop)](https://travis-ci.org/CraftAcademy/quizmaster)
[![Coverage Status](https://coveralls.io/repos/github/CraftAcademy/quizmaster/badge.svg)](https://coveralls.io/github/CraftAcademy/quizmaster)


----------


## Introduction

By Craft Academy - Coding as a craft. 

Pub Quiz made Digital.

It is a work in progress, so at the moment there is no function for authoring quizzes. 

You find the live app on [heroku](http://quizmasterone.herokuapp.com/) 

But to be able to play the game you need to have a quiz code and a quiz needs to be live, so that is not doable yet. 



## Technology
- Cucumber with Capybara and Poltergeist for acceptance testing
- Rspec with Shoulda-matchers for unit testing
- ActionCable for pushing out Greeting and Questions
- Rails 5 as framework



## Motivation

This project exists as a Final project for the Bootcamp students at Craft academy. Also as a fun thing for our graduation party: 
https://www.eventbrite.com/e/craft-academy-halloween-party-2016-registration-28562985659 


## Installation (This part is WIP)

Fork or clone the project, then in your project folder run: 

```
bundle install
rails db:create
rails db:migrate
```

At the moment you need rails `db:seed` as there is no authoring function of quizzes.

You also need to have a `redis server` running and a localhost server with two windows open, one on root path and one at `/quizmaster/quiz/:id` 


## Tests

`rake` runs both rspec and cucumber tests

Testing ActionCable and using multiple browser-windows:
```
Scenario: I send the first question
  Given there is a "team_id" cookie set to "Craft Academy"
  When I am on the quiz page for "Trivia"
  And I switch to a new window
  And I am on the quizmaster page for "Trivia"
  When I press the "Send" button for question "1"
  And I switch to window "1"
  Then I should see "What is 2+2?"
```

## Contributors


[Pivotal tracker](https://www.pivotaltracker.com/n/projects/1901449)


- @thesuss 
- @amberwilkie
- @blokkinen
- @tochman
- @diraulo


## License

Can be found here: 
[License](../blob/develop/LICENSE.md)