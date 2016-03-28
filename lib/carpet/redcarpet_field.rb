require 'redcarpet'
## The module for the Carpet gem.
module Carpet
  ## The module for fields to be rendered.
  module RedcarpetField
    extend ActiveSupport::Concern
    ## The methods that are found in the model.
    module ClassMethods
      def redcarpetable(*fields, renderer: :default, as: [nil], prefixes: ["rendered"], render_opts: {})
        fields.each do |field|
          if fields.count > 1
            define_method "#{prefix}_#{field}" do
            Carpet::Rendering.render(read_attribute(field), renderer_opts: render_opts, rc_renderer: renderer).html_safe
            end # End defining the method dynamically.
          else
            if as[0]
              as.each do |method_name|
                define_method "#{method_name}" do
                Carpet::Rendering.render(read_attribute(field), renderer_opts: render_opts, rc_renderer: renderer).html_safe
                end # End defining the method dynamically.
              end
            else
              define_method "rendered_#{field}" do
              Carpet::Rendering.render(read_attribute(field), renderer_opts: render_opts, rc_renderer: renderer).html_safe
              end # End defining the method dynamically.
            end
          end
        end # End the fields loop.
      end # End the redcarpet method.
    end # End the class methods module.
  end # End the redcarpetfield module.
  module Rendering
    def self.render(text, renderer_opts: {}, rc_renderer: :default)
      renderer = Redcarpet::Render::HTML.new(renderer_opts)
      if rc_renderer != :default
        renderer = load_renderer(rc_renderer, renderer_opts)
      end
      markdown = Redcarpet::Markdown.new(renderer)
      markdown.render text
    end # End the render method.
    def self.load_renderer(renderer_name, renderer_opts)
      renderer_path = Rails.root.join('app', 'redcarpet_renderers', "#{renderer_name.to_s}.rb")
      load renderer_path
      renderer = eval("#{renderer_name.to_s.camelize}.new(renderer_opts)")
      return renderer
    end
  end # End the Rendering module.
end # End the carpet module.

ActiveRecord::Base.send :include, Carpet::RedcarpetField
