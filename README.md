pocrawl
=======
[![Build Status](https://travis-ci.org/kyohei8/pocrawl.png?branch=master)](https://travis-ci.org/kyohei8/pocrawl)

Pocket + Crawl

Add to Pocket periodically retrieves the RSS.

### clone 
```
$ git clone git@github.com:kyohei8/pocrawl.git
$ cd pocrawl
```

### setup 
```
$ bundle install
```
setup database
```
$ rake db:set
```
#### create .evn file
add Pocket App token
```
$ echo POCKET_CONSUMER_KEY=XXXXX-XXXXXXXX-XXXXXX >> .env
```

### start
```
$ foreman start
```

### authentication to pocket
`http://localhost/auth`

-> authentication to pocket

### Heroku Scheduler job command
```
bundle exec ruby scheduler.rb
```
