module ComponentSerializer
  class ConstituencySubheadingComponentSerializer < BaseComponentSerializer
    def initialize(constituency)
      @constituency = constituency
    end

    private

    def name
      'constituency-subheading'
    end

    def data
      {
          current: @constituency.current?,
          subheading: subheading,
          additional_text: additional_text
      }
    end

    def subheading
      @constituency.current? ? "#{region}" : "#{t('constituencies.shared_translations.constituency_from')} #{@constituency.date_range}"
    end

    def region
      @constituency.regions.map { |region| region.name }.first
    end

    def additional_text
      @constituency.current? ? t('constituencies.constituency.constituency_in') : t('.constituencies.constituency.former_constituency', link: link_to(t('.constituencies.constituency.current_constituencies_link'), '/constituencies/current'))
    end
  end
end
