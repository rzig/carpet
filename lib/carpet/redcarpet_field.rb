require 'redcarpet'
## The module for the Carpet gem.
module Carpet
  ## The module for fields to be rendered.
  module RedcarpetField
    extend ActiveSupport::Concern
    ## The methods that are found in the model.
    module ClassMethods
      def redcarpet(*fields, render_opts: {}, renderer: :default)
        fields.each do |field|
          define_method "rendered_#{field}" do
            # This is the method seen in the model. So it might be rendered_name
            # or something.
            Carpet::Rendering.render(read_attribute(field), render_opts: render_opts, md_renderer: renderer).html_safe
          end # End defining the method dynamically.
        end # End the fields loop.
      end # End the redcarpet method.
    end # End the class methods module.
  end # End the redcarpetfield module.
  module Rendering
    def self.render(text, render_opts: {}, md_renderer: :default)
      renderer = Redcarpet::Render::HTML.new(render_opts)
      if md_renderer != :default
        renderer = load_renderer(md_renderer, render_opts)
      end
      markdown = Redcarpet::Markdown.new(renderer)
      markdown.render text
    end # End the render method.
    def self.load_renderer(renderer_name, render_opts: {})
      renderer_path = Rails.root.join('app', 'redcarpet_renderers', "#{renderer_name.to_s}.rb")
      load renderer_path
      renderer = eval("#{renderer_name.to_s.camelize}.new")
      return renderer
    end
  end # End the Rendering module.
end # End the carpet module.

ActiveRecord::Base.send :include, Carpet::RedcarpetField
