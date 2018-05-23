module PageSerializer
  class HomePageSerializer < PageSerializer::BasePageSerializer

    def initialize

    end

    def content
      c = []
      c << ComponentSerializer::HeroComponentSerializer.new(t('.home.index.title'), t('.home.index.new_website', link: link_to(t('.home.index.new_website_link'), 'https://pds.blog.parliament.uk/2017/02/14/a-new-website-for-parliament-first-public-steps/')), t('.home.index.old_website', link: link_to(t('.home.index.old_website_link'), 'https://www.parliament.uk'))).to_h
      c << ComponentSerializer::HomePageSubheadingComponentSerializer.new.to_h
      c << object_to_a_bill
      c << ComponentSerializer::StatusHighlightComponentSerializer.new(object_to_a_bill_blog_post_text).to_h
      c << search
      c << ComponentSerializer::StatusHighlightComponentSerializer.new(search_blog_post_text).to_h
      c << mps_and_lords_information
      c << ComponentSerializer::StatusHighlightComponentSerializer.new(mps_and_lords_blog_post_text).to_h
      c << give_feedback
      c << follow_our_progress
      c
    end

    def title
      "beta.parliament.uk"
    end

    def object_to_a_bill
      heading = t('.home.index.object_to_a_bill.title')
      list_items = [ ComponentSerializer::ListItemComponentSerializer.new('/petition-a-hybrid-bill/2', t('.home.index.object_to_a_bill.object_to_link'), t('.home.index.object_to_a_bill.additional_text')).to_h ]

      ComponentSerializer::ListComponentSerializer.new(heading, list_items, 'ol').to_h
    end

    def object_to_a_bill_blog_post_text
      t('.home.index.object_to_a_bill.blog', link: link_to(t('.home.index.object_to_a_bill.blog_link'), 'https://pds.blog.parliament.uk/2018/02/09/building-a-new-online-service-petitioning-a-hybrid-bill/'))
    end

    def search
      heading = t('.home.index.search.title')
      list_items = [ ComponentSerializer::ListItemComponentSerializer.new('/search', t('.home.index.search.title'), t('.home.index.search.additional_text')).to_h ]

      ComponentSerializer::ListComponentSerializer.new(heading, list_items, 'ol').to_h
    end

    def search_blog_post_text
      t('.home.index.search.blog', link: link_to(t('.home.index.search.blog_link'), 'https://pds.blog.parliament.uk/2017/09/06/launching-the-new-search-service-on-parliament-uk/'))
    end

    def mps_and_lords_information
      heading = t('.home.index.members_info.title')
      list_items = [
        ComponentSerializer::ListItemComponentSerializer.new('/mps', t('.home.index.members_info.mps'), t('.home.index.members_info.current_mps')).to_h,
        ComponentSerializer::ListItemComponentSerializer.new('/lords',t('.home.index.members_info.lords'), t('.home.index.members_info.current_lords')).to_h,
        ComponentSerializer::ListItemComponentSerializer.new('/constituencies', t('.home.index.members_info.constituencies'), t('.home.index.members_info.current_constituencies')).to_h,
        ComponentSerializer::ListItemComponentSerializer.new('/houses/1AFu55Hs/parties/current', t('.home.index.members_info.parties_and_groups'), t('.home.index.members_info.current_parties')).to_h
      ]

      ComponentSerializer::ListComponentSerializer.new(heading, list_items, 'ol').to_h
    end

    def mps_and_lords_blog_post_text
      t('.home.index.members_info.blog', link: link_to(t('.home.index.members_info.blog_link'), 'https://pds.blog.parliament.uk/2017/09/06/launching-the-new-search-service-on-parliament-uk/'))
    end

    def give_feedback
      heading = t('.home.index.feedback.title')
      additional_text = t('.home.index.feedback.provide', link: link_to(t('.home.index.feedback.provide_link'), 'http://www.smartsurvey.co.uk/s/ukparliament-beta-website-feedback/'))

      ComponentSerializer::ContentComponentSerializer.new(heading, additional_text).to_h
    end

    def follow_our_progress
      heading = t(".home.index.follow_progress.title")
      additional_text = t('.home.index.follow_progress.blog', link: link_to(t('.home.index.follow_progress.blog_link'), 'https://pds.blog.parliament.uk/category/parliament-uk/'))

      ComponentSerializer::ContentComponentSerializer.new(heading, additional_text).to_h
    end

  end
end
