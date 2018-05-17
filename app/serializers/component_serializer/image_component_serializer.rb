module ComponentSerializer
  class ImageComponentSerializer < BaseComponentSerializer

    def initialize(figure_url, image_srcset1, image_srcset2, image_src, image_alt)
      @figure_url = figure_url
      @image_srcset1 = image_srcset1
      @image_srcset2 = image_srcset2
      @image_src = image_src
      @image_alt = image_alt
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
