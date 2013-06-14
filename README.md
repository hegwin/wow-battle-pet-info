# WoW BattlePet Info

This is a platform for WoWers (World of Warcraft players) to search the information of the battlepets.

## Where to use it

It's still under development. You can use the [test version](http://42.121.32.27:3000/pets) currently. Unlucky, we don't have the lastest data of the pets added in Patch 5.3. But you can use most of the functions now.

## What is under construction

We use [Pivoltal Tracker](https://www.pivotaltracker.com/s/projects/717559) to manage this project. You can see that what new features will come and which bug will be fixed in the next iteration.

## Bug Report

Please use the [Github issue tracker](https://github.com/hegwin/wow-pet-battle-info/issues) to report bugs.

## Feature Request

Please use the [Github issue tracker](https://github.com/hegwin/wow-pet-battle-info/issues) to add suggestions and feature requests. Not all suggestions will be accepted: there are different people who use this web app, each with separate views. We will, however, try to make it as user friendly as possible...but when a decision is made please accept it.

## Developer Support

### System Requirements

* Ruby ~> 1.9.x
* bundle >= 1.0
* Database: PostgreSQL(recommended) or MySQL etc.

### Install and Configuraion

1. Get the source code: `git clone https://github.com/hegwin/wow-pet-battle-info.git`

2. Database config: `$ cp config/database.example.yml config/database.yml`

3. Install the Gems `$ bundle install`

4. Database structure migrate: `$ bundle exec rake db:migrate`

5. Import the test data: `$ bundle exec rake db:seed`
