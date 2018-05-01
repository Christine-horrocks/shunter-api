module ComponentSerializer
  class ObjectToABillComponentSerializer <BaseComponentSerializer

    def name
      "home-page-component"
    end

    def data
      {
        "subheading": "Object to a bill",
        "list-items": [
          {
            "link-text": "Object to the Additional Provision to the High Speed Rail (West Midlands to Crew) Bill",
            "link": "/petition-a-hybrid-bill/2",
            "additional-text": "This deadline is 1pm on friday 27 April 2018"
          }
        ],
        "blog-link": "https://pds.blog.parliament.uk/2018/02/09/building-a-new-online-service-petitioning-a-hybrid-bill/",
        "blog-text": "Read the Object to a bill blog post."
      }

    end


  end
end
