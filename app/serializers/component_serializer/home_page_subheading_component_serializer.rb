module ComponentSerializer
  class HomePageSubheadingComponentSerializer <BaseComponentSerializer

    def name
      "home-page-subheading"
    end

    def data
      {
        "subheading": subheading
      }

    end

    private

    def subheading
      t('.home.index.whats_on.title')
    end


  end
end
