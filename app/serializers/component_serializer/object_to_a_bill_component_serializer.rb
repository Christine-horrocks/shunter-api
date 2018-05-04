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
            "link-text": t('.home.index.object_to_a_bill.object_to_link'),
            "link": "/petition-a-hybrid-bill/2",
            "additional-text": t('.home.index.object_to_a_bill.object_to')
          }
        ],
        "blog-link": "https://pds.blog.parliament.uk/2018/02/09/building-a-new-online-service-petitioning-a-hybrid-bill/",
        "blog-text": "Read the Object to a bill blog post."
      }

    end


  end
end
