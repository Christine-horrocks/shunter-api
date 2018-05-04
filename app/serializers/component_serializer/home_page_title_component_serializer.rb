module ComponentSerializer
  class HomePageTitleComponentSerializer <BaseComponentSerializer

    def name
      "home-page-title"
    end

    def data
      {
        "title": title,
        "text-with-new-website-link": text_with_new_website_link,
        "text-with-old-website-link": text_with_old_website_link
      }
    end

    private

    def title
      t('.home.index.title')
    end

    def text_with_new_website_link
      text_with_link('.home.index.new_website', '.home.index.new_website_link', 'https://pds.blog.parliament.uk/2017/02/14/a-new-website-for-parliament-first-public-steps/')
    end

    def text_with_old_website_link
      text_with_link('.home.index.old_website', '.home.index.old_website_link', 'https://www.parliament.uk')
    end

  end
end
