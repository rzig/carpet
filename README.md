# Carpet
Welcome to carpet. The idea of this gem is to provide redcarpet markdown parsing in model fields. This prevents you from having to call redcarpet in a controller or model a bunch of times, which is not very dry.

## Usage
Add ```ruby
redcarpet_field :field_name
```
to your model. You can access the generated markdown for this field by calling ```ruby yourmodel.parsed_fieldname```.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'carpet'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install carpet
```

Make a folder under app called rcrenderers - your custom redcarpet renderers will go here.

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
