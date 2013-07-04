pocrawl
=======
[![Build Status](https://travis-ci.org/kyohei8/pocrawl.png?branch=master)](https://travis-ci.org/kyohei8/pocrawl)

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

### authentication to pocket
`http://localhost/auth`

-> authentication to pocket

### Heroku Scheduler job command
```
bundle exec ruby scheduler.rb
```
