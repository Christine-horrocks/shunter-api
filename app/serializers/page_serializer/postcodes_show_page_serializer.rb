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
          {
              "name": "block",
              "data": {
                  "css_class": "block",
                  "components": [
                      {
                          "name": "heading",
                          "data": {
                              "heading": "<a href='/constituencies/#{@constituency.graph_id}'>#{@constituency.name}</a>",
                              "weight": 2
                          }
                      }
                  ]
              }
          },
          {
              "name": "list",
              "data": {
                  "list-type": "ul",
                  "css_class": "list--block",
                  "components": [
                      {
                          "name": "card",
                          "data": {
                              "components": [
                                  {
                                      "name": "image",
                                      "data": {
                                          "css_class": "avatar--round",
                                          "figure_url": "wVI7ebTP",
                                          "image_src": "https://static.parliament.uk/pugin/1.9.3/images/placeholder_members_image.png"

                                      }
                                  },
                                  {
                                      "name": "card-details",
                                      "data": {
                                          "components": [
                                              {
                                                  "name": "heading",
                                                  "data": {
                                                      "heading": "<a href='/people/#{@person.graph_id}'>#{@person.display_name}</a>",
                                                      "weight": 2
                                                  }
                                              },
                                              {
                                                  "name": "paragraph",
                                                  "data": {
                                                      "text": [
                                                          "MP for #{@person.current_seat_incumbency&.constituency&.name}",
                                                          "#{@person.try(:current_party).try(:name)}"
                                                      ]
                                                  }
                                              }
                                          ]
                                      }
                                  }
                              ]
                          }
                      }
                  ]
              }
          },
          ComponentSerializer::ParagraphComponentSerializer.new(["<a href='/postcodes'>Check for a different postcode</a>"]).to_h
      ]
    end

    def title
      'Find your constituency'
    end

  end
end