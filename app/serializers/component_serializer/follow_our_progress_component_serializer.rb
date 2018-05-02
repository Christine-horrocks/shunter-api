module ComponentSerializer
  class FollowOurProgressComponentSerializer <BaseComponentSerializer

    def name
      "home-page-non-list-component"
    end

    def data
      {
        "subheading": "Follow our progress",
        "link-text": "Follow all new website developments on our blog.",
        "link": "https://pds.blog.parliament.uk/category/parliament-uk/",
      }

    end


  end
end
