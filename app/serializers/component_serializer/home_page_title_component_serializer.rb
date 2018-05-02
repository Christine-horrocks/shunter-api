module ComponentSerializer
  class HomePageTitleComponentSerializer <BaseComponentSerializer

    def name
      "home-page-title"
    end

    def data
      {
        "title": I18n.t('.home.index.title'),
        "prelink-text": "",
        "link-text": I18n.t('.home.index.new_website'),
        "link": "https://pds.blog.parliament.uk/2017/02/14/a-new-website-for-parliament-first-public-steps/",
        "postlink-text": ""

      }

    end


  end
end
