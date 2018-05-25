module ComponentSerializer
  # Creates a hash containing all elements needed to produce a responsive image.
  class ImageComponentSerializer < BaseComponentSerializer
    # Initialise an image component with a hash of image data.
    #
    # @param [Hash] image_data a hash of image data.
    # @example { figure_url: 'data', image_srcset1: 'data', image_srcset2: 'data', image_src: 'data', image_alt: 'data'}
    def initialize(image_data)
      @figure_url = image_data[:figure_url]

      @image_srcset1 = image_data[:image_srcset1]
      @image_srcset2 = image_data[:image_srcset2]

      @image_src = image_data[:image_src]
      @image_alt = image_data[:image_alt]
    end

    private

    def name
      "image"
    end

    def data
      {
          "figure-url": @figure_url,

          "image-srcset1": @image_srcset1,
          "image-srcset2": @image_srcset2,

          "image-src": @image_src,
          "image-alt": @image_alt
      }
    end

  end
end