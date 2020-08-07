# Rails REST API CanCanCan and Knock

Simple API based on Ruby on Rails by implementin [CanCanCan](https://github.com/CanCanCommunity/cancancan) and [Knock](https://github.com/nsarno/knock)

## Installation
If you don't have ruby, i recommende to use [Rbenv](https://github.com/rbenv/rbenv). Then,
```
gem install bundler
bundle install
```
Then configure database (it uses sqlite3 by default) in config/databse.yml and run migrations and seeds:
```
rails db:migrate
rails db:seed
```

Seeds adds 3 users:
admin - admin@tnklst.com / 123456
curation - curation@tnklst.com / 123456
visitor - visitor@tnklst.com / 123456

## Run
Run the server
```
rails s
```

This repo is inspired by [Rails 5 REST API with CanCan](https://github.com/stalniy/rails-cancan-api-example)
