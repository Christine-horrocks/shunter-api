module ComponentSerializer
  class ObjectToABillComponentSerializer <BaseComponentSerializer

    def name
      "home-page-component"
    end

    def data
      {
        "subheading": subheading,
        "list-items": [
          {
            "link": link,
            "additional-text": additional_text
          }
        ],
        "blog-text-with-link": blog_text_with_link
      }

    end

    private

    def subheading
      t('.home.index.object_to_a_bill.title')
    end

    def link
      whole_text_link('.home.index.object_to_a_bill.object_to_link', "/petition-a-hybrid-bill/2")
    end

    def additional_text
      t('.home.index.object_to_a_bill.additional_text')
    end

    def blog_text_with_link
      text_with_link('.home.index.object_to_a_bill.blog', '.home.index.object_to_a_bill.blog_link', "https://pds.blog.parliament.uk/2018/02/09/building-a-new-online-service-petitioning-a-hybrid-bill/")
    end

  end
end
