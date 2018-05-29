module PageSerializer
  # Initialises all the components that are required for the Postcodes show page.
  class PostcodesShowPageSerializer < PageSerializer::BasePageSerializer
    def initialize(constituency, postcode, person)
      @constituency = constituency
      @postcode = postcode
      @person = person
    end

    private

    def content
      {
          "name": "section-primary",
          "data": {
              "components": sub_components
          }
      }
    end

    def sub_components
      [
          ComponentSerializer::HeadingComponentSerializer.new("<span>Results for #{@postcode.upcase}</span>", 1).to_h,
          ComponentSerializer::BlockComponentSerializer.new([ComponentSerializer::HeadingComponentSerializer.new("<a href='/constituencies/#{@constituency.graph_id}'>#{@constituency.name}</a>", 2).to_h]).to_h,
          ComponentSerializer::ListComponentSerializer.new([ComponentSerializer::CardComponentSerializer.new(card_components).to_h], '--block').to_h,
          ComponentSerializer::ParagraphComponentSerializer.new(["<a href='/postcodes'>Check for a different postcode</a>"]).to_h
      ]
    end

    def card_components
      [
          ComponentSerializer::ImageComponentSerializer.new(image_data).to_h,
          ComponentSerializer::CardDetailsComponentSerializer.new(card_details_components).to_h
      ]
    end

    def card_details_components
      [
          ComponentSerializer::HeadingComponentSerializer.new("<a href='/people/#{@person.graph_id}'>#{@person.display_name}</a>", 2).to_h,
          ComponentSerializer::ParagraphComponentSerializer.new([
                                                                    "MP for #{@person.current_seat_incumbency&.constituency&.name}",
                                                                    "#{@person.try(:current_party).try(:name)}"
                                                                ])
      ]
    end

    def image_data
      {
          figure_url: "/people/#{@person.graph_id}",
          image_srcset1: generate_srcset(@person.image_id, 'CU_5:2', 732, 1464),
          image_srcset2: generate_srcset(@person.image_id, 'MCU_3:2', 444, 888),
          image_src: generate_image_src(@person.image_id, 'CU_1:1', '186'),
          image_alt: "#{@person.display_name}"
      }
    end

    def generate_srcset(id, crop, small_width, large_width)
      return placeholder_image if @person.image_id == 'placeholder'

      small_src = generate_image_src(id, crop, small_width)
      large_src = generate_image_src(id, crop, large_width)

      "#{small_src}, #{large_src} 2x"
    end

    def generate_image_src(id, crop, width)
      return placeholder_image if @person.image_id == 'placeholder'

      "#{ENV['IMAGE_SERVICE_URL']}/#{id}.jpeg?crop=#{crop}&width=#{width}&quality=80"
    end

    def placeholder_image
      'https://static.parliament.uk/pugin/1.9.3/images/placeholder_members_image.png'
    end

    def title
      'Find your constituency'
    end

  end
end