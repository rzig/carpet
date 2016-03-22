# Carpet
Welcome to carpet. The idea of this gem is to provide redcarpet markdown parsing in model fields. This prevents you from having to call redcarpet in a controller or model a bunch of times, which is not very dry.

## Usage
Add
```ruby
  redcarpetable :field_name
```
to your model. If you want to add some renderer options, just put them in like this:
```ruby
  redcarpetable :field_name, render_opts: {option: value}
```
You can access the generated markdown for this field by calling ```ruby yourmodel.rendered_fieldname```.

If you want to use your own custom redcarpet renderer, run:
```bash
$ rails g carpet renderer_name
```
To use this renderer in your model, call it like this:
```ruby
  redcarpetable :field_name, renderer: :your_renderer_name
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'carpet', git: "git://github.com/railsrocks/Carpet.git"
```

And then execute:
```bash
$ bundle
```
## Contributing
Feel free to make a pull request!

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
