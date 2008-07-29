module StaticMatic::TemplateHandlers
  class Sass < ActionView::TemplateHandler
    def render(template, local_assigns = {})
      template = template.source if template.respond_to? :source
      ::Sass::Engine.new(template, StaticMatic::Config[:sass_options]).render
    end
  end
end