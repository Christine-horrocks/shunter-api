module ComponentSerializer
  class HomePageSearchComponentSerializer <BaseComponentSerializer

    def name
      "home-page-component"
    end

    def data
      {
        "subheading": "Search",
        "list-items": [
          {
            "link-text": "Search",
            "link": "/search",
            "additional-text": "Find results from current parliament.uk websites."
          }
        ],
        "blog-link": "https://pds.blog.parliament.uk/2017/09/06/launching-the-new-search-service-on-parliament-uk/",
        "blog-text": "Read the Search blog post."
      }

    end


  end
end
