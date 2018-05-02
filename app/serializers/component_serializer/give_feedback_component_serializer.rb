module ComponentSerializer
  class GiveFeedbackComponentSerializer <BaseComponentSerializer

    def name
      "home-page-non-list-component"
    end

    def data
      {
        "subheading": "Give feedback",
        "link-text": "We want your feedback to help us improve these pages further.",
        "link": "http://www.smartsurvey.co.uk/s/ukparliament-beta-website-feedback/",
      }

    end


  end
end
