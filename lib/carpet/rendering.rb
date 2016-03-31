module Carpet
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
end
