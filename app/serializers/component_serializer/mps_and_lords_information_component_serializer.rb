module ComponentSerializer
  class MpsAndLordsInformationComponentSerializer <BaseComponentSerializer

    def name
      "home-page-component"
    end

    def data
      {
        "subheading": t('.home.index.members_info.title'),
        "list-items": [
          {
          "link": whole_text_link('.home.index.members_info.mps', "/mps"),
          "additional-text": t('.home.index.members_info.current_mps')
          },
          {
          "link": whole_text_link('.home.index.members_info.lords', "/lords"),
          "additional-text": t('.home.index.members_info.current_lords')
          },
          {
            "link": whole_text_link('.home.index.members_info.constituencies', "/constituencies"),
            "additional-text": t('.home.index.members_info.current_constituencies')
          },
          {
            "link": whole_text_link('.home.index.members_info.parties_and_groups', "/houses/1AFu55Hs/parties/current"),
            "additional-text": t('.home.index.members_info.current_parties')
          }
        ],

        "blog-text-with-link": text_with_link('.home.index.members_info.blog', '.home.index.members_info.blog_link', "https://pds.blog.parliament.uk/2017/09/06/launching-the-new-search-service-on-parliament-uk/")
      }

    end


  end
end
