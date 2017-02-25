# Carpet
Welcome to Carpet. This gem allows you to render fields of a model with [Redcarpet](https://github.com/vmg/redcarpet). Instead of having to write a custom method in your model or controller to render a model's field with Redcarpet, Carpet allows you to do it in one line.

## Installation
Carpet is a Ruby on Rails plugin. To start using Carpet, add the following line to your application's Gemfile:
```ruby
  gem 'carpet', git: "git://github.com/rzig/carpet.git"
```
Now, execute:
```bash
  $ bundle
```
Congratulations! You're all ready to start using Carpet.

## Usage
Carpet is designed to be simple to use, but has many options available. The simplest way of using Carpet will be to add the following line to your model:
```ruby
  redcarpetable :field_name
```
This will render whatever field you provided with the standard [Redcarpet HTML renderer](https://github.com/vmg/redcarpet#darling-i-packed-you-a-couple-renderers-for-lunch). If you want to specify multiple fields to render, separate them with commas, like this:
```ruby
  redcarpetable :field_name, :another_field_name, :yet_another_field_name
```

### Options
Redcarpet also allows you to pass a set of options to the renderer (these can be any standard Redcarpet options). To specify these options, add a ```render_opts``` hash to the line, like so:
```ruby
  redcarpetable :field_name, render_opts: {some_option: some_value}
```
If you specify multiple fields in the same line, the render options will apply to all of them. If you need different render options for each field, you will have to make a new line for each field.

To access the rendered content for a field, use the following statement:
```ruby
  yourmodel.rendered_field_name
```

### Aliases
If you need to customize the name the method that provides the rendered Markdown, specify an array of alternative names, like this:
```ruby
  redcarpetable :field_name, as: [:some_name, :some_other_name]
```
So, then you could say:
```ruby
  yourmodel.some_other_name
```
or:
```ruby
  yourmodel.some_name
```

### Prefixes
If you have specified multiple fields in one line, it is not possible to change the name of the method that provides the rendered field. However, the prefix for that method can be set like this:
```ruby
  redcarpetable :field_name, :another_field_name, prefixes: ["cool", "rendered"]
```
So, then the rendered content of those two fields is available through:
```ruby
  yourmodel.cool_field_name
  yourmodel.cool_another_field_name
```
and:
```ruby
  yourmodel.rendered_field_name
  yourmodel.rendered_another_field_name
```
If you want to use your own Redcarpet renderer, see [this guide](https://github.com/rzig/carpet/wiki/Generate-a-Custom-Renderer). More examples are available at [the wiki examples page](https://github.com/rzig/carpet/wiki/Examples).
If you need help, feel free to post a question on the repository.

## Contributing
Feel free to make a pull request!

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
