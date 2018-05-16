module PageSerializer
  class BasePageSerializer < BaseSerializer
    def to_h
      {
        layout: {
            'template': 'layout',
        },
        title: title,
        components: components
      }
    end

    private

    def components
      components_array = []
      components_array << header
      components_array << content
      components_array << footer
      components_array.flatten
    end

    def header
      header = []
      header << { name: 'cookie-banner', data: 'cookie-banner' }
      header << { name: 'banner', data: 'banner' }
      header << { name: 'header', data: 'header' }

      header
    end

    def title
      raise 'You must implement #title'
    end

    def footer
      { name: 'footer', data: 'footer' }
    end
  end
end
