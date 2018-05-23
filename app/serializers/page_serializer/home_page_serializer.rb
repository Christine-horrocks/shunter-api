module PageSerializer
  class HomePageSerializer < PageSerializer::BasePageSerializer

    def initialize

    end

    def content
      c = []
      c << ComponentSerializer::HeroComponentSerializer.new(t('.home.index.title'), t('.home.index.new_website', link: link_to(t('.home.index.new_website_link'), 'https://pds.blog.parliament.uk/2017/02/14/a-new-website-for-parliament-first-public-steps/')), t('.home.index.old_website', link: link_to(t('.home.index.old_website_link'), 'https://www.parliament.uk'))).to_h
      c << ComponentSerializer::HomePageSubheadingComponentSerializer.new.to_h
      c << ComponentSerializer::HeadingComponentSerializer.new(t('.home.index.object_to_a_bill.title'), size: 3).to_h
      c << object_to_a_bill
      c << ComponentSerializer::StatusHighlightComponentSerializer.new(object_to_a_bill_blog_post_text).to_h
      c << ComponentSerializer::HeadingComponentSerializer.new(t('.home.index.search.title'), size: 3).to_h
      c << search
      c << ComponentSerializer::StatusHighlightComponentSerializer.new(search_blog_post_text).to_h
      c << ComponentSerializer::HeadingComponentSerializer.new(t('.home.index.members_info.title'), size: 3).to_h
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
      card_items = [ ComponentSerializer::HeadingComponentSerializer.new(link_to(t('.home.index.object_to_a_bill.object_to_link'), '/petition-a-hybrid-bill/2'), size: 4).to_h, ComponentSerializer::ParagraphComponentSerializer.new([t('.home.index.object_to_a_bill.additional_text')]).to_h ]
      list_items = [ ComponentSerializer::CardComponentSerializer.new(card_items).to_h]

      ComponentSerializer::ListComponentSerializer.new(list_items, '--block').to_h
    end

    def object_to_a_bill_blog_post_text
      t('.home.index.object_to_a_bill.blog', link: link_to(t('.home.index.object_to_a_bill.blog_link'), 'https://pds.blog.parliament.uk/2018/02/09/building-a-new-online-service-petitioning-a-hybrid-bill/'))
    end

    def search
      card_items = [ComponentSerializer::HeadingComponentSerializer.new(link_to(t('.home.index.search.title'), '/search'), size: 4).to_h, ComponentSerializer::ParagraphComponentSerializer.new([t('.home.index.search.additional_text')]).to_h]
      list_items = [ ComponentSerializer::CardComponentSerializer.new(card_items).to_h]

      ComponentSerializer::ListComponentSerializer.new(list_items, '--block').to_h
    end

    def search_blog_post_text
      t('.home.index.search.blog', link: link_to(t('.home.index.search.blog_link'), 'https://pds.blog.parliament.uk/2017/09/06/launching-the-new-search-service-on-parliament-uk/'))
    end

    def mps_and_lords_information
      card_items_mps = [ComponentSerializer::HeadingComponentSerializer.new(link_to(t('.home.index.members_info.mps'), '/mps'), size: 4).to_h, ComponentSerializer::ParagraphComponentSerializer.new([t('.home.index.members_info.current_mps')]).to_h]
      card_items_lords = [ComponentSerializer::HeadingComponentSerializer.new(link_to(t('.home.index.members_info.lords'), '/lords'), size: 4).to_h, ComponentSerializer::ParagraphComponentSerializer.new([t('.home.index.members_info.current_lords')]).to_h]
      card_items_constituencies = [ComponentSerializer::HeadingComponentSerializer.new(link_to(t('.home.index.members_info.constituencies'), '/constituencies'), size: 4).to_h, ComponentSerializer::ParagraphComponentSerializer.new([t('.home.index.members_info.current_constituencies')]).to_h]
      card_items_parties_and_groups = [ComponentSerializer::HeadingComponentSerializer.new(link_to(t('.home.index.members_info.parties_and_groups'), '/houses/1AFu55Hs/parties/current'), size: 4).to_h, ComponentSerializer::ParagraphComponentSerializer.new([t('.home.index.members_info.current_parties')]).to_h]

      list_items = [
        ComponentSerializer::CardComponentSerializer.new(card_items_mps).to_h,
        ComponentSerializer::CardComponentSerializer.new(card_items_lords).to_h,
        ComponentSerializer::CardComponentSerializer.new(card_items_constituencies).to_h,
        ComponentSerializer::CardComponentSerializer.new(card_items_parties_and_groups).to_h
      ]

      ComponentSerializer::ListComponentSerializer.new(list_items, '--block').to_h
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
