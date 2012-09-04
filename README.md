![Glengarry](http://f.cl.ly/items/3X0b2u0Z2F2d3E1A3q0v/Screen%20Shot%202012-09-04%20at%202.50.35%20PM.png)

## Glengarry

Glengarry is a Rails 3.2 engine that allows you to collect and provides an interface for collecting email leads, CAUSE YOU SHOULD ALWAYS BE CLOSIN'.

The email address, IP Address submitting the email address, and reverse geo-coded latitude, longitude, city and country are stored and presented to you in this lovely UI:
![UI](http://f.cl.ly/items/2p2y0L3g3V0B1S0h1A37/Screen%20Shot%202012-09-04%20at%203.45.21%20PM.png)

You can also download all of the captured emails as a CSV file. JOY.

## Installation

Add the gem to your gemfile as follows:

    gem 'glengarry'

Then run ```bundle install```. Now install the migrations:

    bundle exec glengarry:install:migrations

## Lockin' that down

You can add basic HTTP authentication by creating an initializer in your ```config``` directory like so:

    Glengarry::ApplicationController.authenticator = proc {
      authenticate_or_request_with_http_basic 'Glengarry' do |user_name, password|
        user_name == 'username' && password == 'password'
      end
    }

## Specs

You'll have to use the dummy application under spec/dummy to first create the test database. Then simply do the usual:

    bundle exec rake spec