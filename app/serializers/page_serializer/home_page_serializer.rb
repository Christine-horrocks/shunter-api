module PageSerializer
  class HomePageSerializer < PageSerializer::BasePageSerializer

    def initialize()

    end

    def content
      c = []
      c << ComponentSerializer::HomePageTitleComponentSerializer.new.to_h
      # c << "welcome message and links to the old website"
      # c << "object to a bill title, example, link to a blog"
      # c << "search title, link and blog"
      # c << "MPs and Lords information, links to MPs, Lords, Constituencies and Parties and groups"
      # c << "Give feedback title and link"
      # c << "Follow our progress title and link to blog"

      c
    end

  def title
    "beta.parliament.uk"
  end

  end
end
