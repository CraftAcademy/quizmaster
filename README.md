Welcome to Quizmaster(one)!
===================


You find the live app on heroku: 
http://quizmasterone.herokuapp.com/
But to be able to play the game you need to have a quiz code and a quiz needs to be live, so that is not doable yet. 

If you do want to try it out live, come to our graduation/Halloween party at 
https://www.eventbrite.com/e/craft-academy-halloween-party-2016-registration-28562985659 



----------


### 
Technical details
-------------------

- Cucumber with Capybara and Poltergeist for acceptancetesting
- Rspec with Shoulda-matchers for unit testing
- Action cable for pushing out Greeting and Questions
- Rails 5 as foundation



Download and run
-------------------


### Installing:

```
bundle install
rails db:create
rails db:migrate
rails db:seed
```
You also need to have a `redis server` running and a localhost server with two windows open, one on root path and one at `/quizmaster/quiz/#number of quiz` 


### UML diagrams

You can also render sequence diagrams like this:

```sequence
Quizmaster->Player: What is the capital of Spain?
Note right of Player: Player thinks
Player-->Quizmaster: Madrid!
```

