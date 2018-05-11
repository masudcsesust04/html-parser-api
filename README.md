# HTML parser API app

It's a sample application to parse HTML file using API call. 

* Ruby version >=2.4.1
```
$ ruby -version
```

* Rails version >=5.2.0
```
$ rails -v
```
* System dependencies

* Configuration[save follow file as database.yml and update configuration as needed]
```
config/database.example.yml 
```

* Database creation
```
$ rake db:create
```

* Database initialization
```
$ bundle exec rake db:schema:load
$ bundle exee rake db:test:prepare
```

* Run server
```
$ bundle exec rails s
```

* How to run the test suite
```
$ bundle exec rspec
```

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

## API uses example

### 1. Parse a web page[it will parse all content with tag h1, h2, h3 and a]
Request
```
http://localhost:3000/contents/parse?ref_url=http://getbootstrap.com
```
Response
```
{"success":true,"code":200,"message":"OK"}
```

### 2. Fetch list of matched content [it will fetch all of the parsed content]
Request
```
http://localhost:3000/contents
```
Response
```
{"data":[{"id":"1","type":"contents","links":{"self":"http://localhost:3000/contents/1"},"attributes":{"url":"http://getbootstrap.com","tag":"h1","content":"Bootstrap"}},{"id":"2","type":"contents","links":{"self":"http://localhost:3000/contents/2"},"attributes":{"url":"http://getbootstrap.com","tag":"h3","content":"Installation"}},{"id":"3","type":"contents","links":{"self":"http://localhost:3000/contents/3"},"attributes":{"url":"http://getbootstrap.com","tag":"h3","content":"BootstrapCDN"}},{"id":"4","type":"contents","links":{"self":"http://localhost:3000/contents/4"},"attributes":{"url":"http://getbootstrap.com","tag":"h3","content":"Official Themes"}},{"id":"5","type":"contents","links":{"self":"http://localhost:3000/contents/5"},"attributes":{"url":"http://getbootstrap.com","tag":"a","content":"Bootstrap\n"}},{"id":"6","type":"contents","links":{"self":"http://localhost:3000/contents/6"},"attributes":{"url":"http://getbootstrap.com","tag":"a","content":"Home"}},{"id":"7","type":"contents","links":{"self":"http://localhost:3000/contents/7"},"attributes":{"url":"http://getbootstrap.com","tag":"a","content":"Documentation"}},{"id":"8","type":"contents","links":{"self":"http://localhost:3000/contents/8"},"attributes":{"url":"http://getbootstrap.com","tag":"a","content":"Examples"}}]}
```


