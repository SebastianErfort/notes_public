---
title: Ruby
name: Ruby
url: "https://www.ruby-lang.org/en/"
docs: "https://www.ruby-lang.org/en/documentation/"
github: "https://github.com/ruby/ruby"
type: interpreted
category: programming-language
visibility: public
---
### Links

[Storing Objects in YAML with Ruby](https://medium.com/launch-school/storing-objects-in-yaml-with-ruby-d02c60e0dc65) | [local files](file://edu/ruby/yamltut)
[Ghost Methods: method_missing](https://pabloadell.medium.com/ruby-cool-kid-rb-meta-programming-series-ghost-methods-765b0400a0f8) | [local](file://notes/life/tech/ruby_ghostMethods.pdf)
[Remco's tutorials](file://edu/ruby/remco/programming-in-ruby)

### Web/HTTP requests

https://www.twilio.com/blog/5-ways-make-http-requests-ruby
_Basic GET request_
```ruby
# nethttp.rb
require 'uri'
require 'net/http'

uri = URI('https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY')
res = Net::HTTP.get_response(uri)
puts res.body if res.is_a?(Net::HTTPSuccess)
```


## Packages & Repos

### Gemfile
Install gem from Git repository
```ruby
gem 'redcarpet', :git => 'git://github.com/tanoku/redcarpet.git', :branch => 'yourbranch'
```

### Bundle
Install ruby gems locally (for project)
```bash
bundle config set --local path '.bundle'
bundle install
```

### RVM (Ruby Version Manager)
2023-05-08:
Failed to fetch a version of ruby for me
```bash
rvm install ruby-3
```