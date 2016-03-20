require 'redcarpet'
## The module for the Carpet gem.
module Carpet
  ## The module for fields to be parsd.
  module RedcarpetField
    extend ActiveSupport::Concern
    ## The methods that are found in the model.
    module ClassMethods
      def redcarpet(*fields, render_opts: {}, renderer: :default)
        fields.each do |field|
          define_method "rendered_#{field}" do
            # This is the method seen in the model. So it maight be parsed_name
            # or something.
            Carpet::Parsing.parse(read_attribute(field), render_opts: render_opts, parser: renderer).html_safe
          end # End defining the method dynamically.
        end # End the fields loop.
      end # End the redcarpet method.
    end # End the class methods module.
  end # End the redcarpetfield module.
  module Parsing
    def self.parse(text, render_opts: {}, parser: :default)
      renderer = Redcarpet::Render::HTML.new(render_opts)
      if parser != :default
        renderer = load_parser(parser)
      end
      markdown = Redcarpet::Markdown.new(renderer)
      markdown.render text
    end # End the parse method.
    def self.load_parser(parser_name)
      parser_path = Rails.root.join('mdrenderers', "#{parser_name.to_s}.rb")
      load parser_path
      parser = eval("Redcarpet::Render::HTML::#{parser_name.to_s.camelize}.new")
      return parser
    end
  end # End the parsing module.
end # End the carpet module.

ActiveRecord::Base.send :include, Carpet::RedcarpetField
