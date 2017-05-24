# README

This is our Cloney Island Project!! ROMPHIM

run `Bundle`

run `rake db:reset`

run `bundle exec figaro install` & add keys to `config/application.yml`:
```  
GOOGLE_CLIENT_ID: <KEY>
GOOGLE_CLIENT_SECRET: <SECRET_KEY>
FACEBOOK_KEY: <KEY>
FACEBOOK_SECRET: <SECRET_KEY>
test:
  GOOGLE_USER_TOKEN:
  FACEBOOK_USER_TOKEN:
```
**Internal API**

The following api endpoints are available:

*For users*

`/api/v1/users/money/most_revenue` lists users who have made the most money as property owners based on reservation income. Can take a `limit` param, default is 10 users.

`/api/v1/users/money/most_spent` lists users who have spent the most money on reservations. Can take a `limit` param, default is 10.

`/api/v1/users/properties/most_properties` lists users who have the most properties listed that they are the owner of. Can take a `limit` param, default is 10.

`/api/v1/users/reservations/bookings` lists users who have made the most reservations. Can take a `limit` param, default is 10.

`/api/v1/users/reservations/nights` lists users who have booked the most number of nights. Can take a `limit` param, default is 10.

*For reservations*

`/api/v1/reservations/by_month` lists count of reservations by month. Can take a `city` param, that scopes to reservations by month for that city, default is for all reservations.


* Ruby version:

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
