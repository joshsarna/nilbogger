## Nilbogger Gem

This gem was created to protect against `undefined method __ for nil:NilClass` errors. It's often difficult to anticipate the shape of complex JSON objects from web requests. The goal of this gem is to reduce the amount of lines of code that look like:

```
response.parse && response.parse.data && response.parse.data[0] && response.parse.data[0].weather && response.parse.data[0].weather.temp
```

(Chained `if`s and ternary operators are also out.)

### Installation

Gemfile: `gem 'nilbogger'`

Install: `gem install nilbogger`

### Usage

```
fruit_colors = {banana: 'yellow', orange: 'orange', avocado: 'green'}

p fruit_colors[:banana].upcase  # => "YELLOW"
p fruit_colors[:apple]  # => nil
p fruit_colors[:apple].upcase  # => undefined method `upcase' for nil:NilClass (NoMethodError)
```

With Nilbogger:
```
p Nilbogger::nil_try{ fruit_colors[:banana].upcase }  # => "YELLOW"
p Nilbogger::nil_try{ fruit_colors[:apple].upcase }  # => nil
```

Using Nilbogger custom return values:

```
p Nilbogger::nil_try(false){ fruit_colors[:banana].upcase }  # => "YELLOW"
p Nilbogger::nil_try(false){ fruit_colors[:apple].upcase }  # => false
```