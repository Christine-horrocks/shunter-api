module PageSerializer
  class HomePageSerializer < PageSerializer::BasePageSerializer

    def initialize

    end

    def content
      c = []
      c << ComponentSerializer::HomePageTitleComponentSerializer.new.to_h
      c << ComponentSerializer::HomePageSubheadingComponentSerializer.new.to_h
      c << ComponentSerializer::ObjectToABillComponentSerializer.new.to_h
      c << ComponentSerializer::HomePageSearchComponentSerializer.new.to_h
      c << ComponentSerializer::MpsAndLordsInformationComponentSerializer.new.to_h
      c << ComponentSerializer::GiveFeedbackComponentSerializer.new.to_h
      c << ComponentSerializer::FollowOurProgressComponentSerializer.new.to_h
      c
    end

  def title
    "beta.parliament.uk"
  end

  end
end
