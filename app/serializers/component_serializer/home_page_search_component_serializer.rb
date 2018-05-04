module ComponentSerializer
  class HomePageSearchComponentSerializer <BaseComponentSerializer

    def name
      "home-page-component"
    end

    def data
      {
        "subheading": subheading,
        "list-items": [
          {
            "link": link,
            "additional-text": additional_text
          }
        ],
        "blog-text-with-link": blog_text_with_link
      }

    end

    private

    def subheading
      t('.home.index.search.title')
    end

    def link
      whole_text_link('.home.index.search.title', "/search")
    end

    def additional_text
      t('.home.index.search.additional_text')
    end

    def blog_text_with_link
      text_with_link('.home.index.search.blog', '.home.index.search.blog_link', "https://pds.blog.parliament.uk/2017/09/06/launching-the-new-search-service-on-parliament-uk/")
    end

  end
end
