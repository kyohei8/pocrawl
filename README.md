pocrawl
=======
https://travis-ci.org/kyohei8/pocrawl.png

Pocket + Crawl

Add to Pocket periodically retrieves the RSS.

### setup 
```
$ bundle install
```
setup database
```
$ rake db:set
```

### start
```
foreman start
```

### Heroku Scheduler job command
```
bundle exec ruby scheduler.rb
```
