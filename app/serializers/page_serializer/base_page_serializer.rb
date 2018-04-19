module PageSerializer
  class BasePageSerializer < BaseSerializer

    def initialize(person)
      @person = person
    end

    def to_h
      {
        layout: {
            "template": "layout",
        },
        title: title,
        components: components
      }
    end

    def components
      components_array = []
      components_array << header
      components_array << content
      components_array << footer
      components_array.flatten
    end

    def header
      [
        { name: "cookie-banner", data: "cookie-banner" },
        { name: "banner", data: "banner" },
        { name: "header", data: "header" }
      ]
    end

    def title
      ""
    end

    def footer
      { name: "footer" ,data: "footer" }
    end

  end
end
