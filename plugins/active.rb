class String
  def starts_with?(characters)
      self.match(/^#{characters}/) ? true : false
  end
end

module CGB
  class ActiveTag < Liquid::Tag
    def initialize(tag_name, url, token)
      super
      @url = url.strip
    end

    def render(context)
      "active" if context.environments.first["page"]["url"].starts_with? @url
    end
  end

end

Liquid::Template.register_tag('active', CGB::ActiveTag)
