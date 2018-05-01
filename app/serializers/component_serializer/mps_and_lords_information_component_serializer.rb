module ComponentSerializer
  class MpsAndLordsInformationComponentSerializer <BaseComponentSerializer

    def name
      "home-page-component"
    end

    def data
      {
        "subheading": "MPs and Lords information",
        "list-items": [
          {
          "link-text": "MPs",
          "link": "/mps",
          "additional-text": "View all current members of the House of Commons."
          },
          {
          "link-text": "Lords",
          "link": "/lords",
          "additional-text": "View all current members of the House of Lords."
          },
          {
            "link-text": "Constituencies",
            "link": "/constituencies",
            "additional-text": "Find all current MPs by the are they are represent."
          },
          {
            "link-text": "Parties and groups",
            "link": "/houses/1AFu55Hs/parties/current",
            "additional-text": "Find all current MPs and Lords by their party or group."
          }
        ],
        "blog-link": "https://pds.blog.parliament.uk/2017/09/06/launching-the-new-search-service-on-parliament-uk/",
        "blog-text": "Read the MPs and Lords information blog post."
      }

    end


  end
end
