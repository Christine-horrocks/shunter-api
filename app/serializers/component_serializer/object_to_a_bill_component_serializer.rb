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
            "text-with-link": text_with_link('.home.index.object_to_a_bill.object_to', '.home.index.object_to_a_bill.object_to_link', "/petition-a-hybrid-bill/2")
          }
        ],
        "blog-text-with-link": text_with_link('.home.index.object_to_a_bill.blog', '.home.index.object_to_a_bill.blog_link', "https://pds.blog.parliament.uk/2018/02/09/building-a-new-online-service-petitioning-a-hybrid-bill/")
      }

    end


  end
end
