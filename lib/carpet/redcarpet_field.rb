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
            prefixes.each do |prefix|
              define_method "#{prefix}_#{field}" do
              Carpet::Rendering.render(read_attribute(field), renderer_opts: render_opts, rc_renderer: renderer).html_safe
              end # End defining the method dynamically.
            end
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
end # End the carpet module.

ActiveRecord::Base.send :include, Carpet::RedcarpetField
