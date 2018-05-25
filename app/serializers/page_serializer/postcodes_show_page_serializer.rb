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
          {
              "name": "heading",
              "data": {
                  "weight": 1,
                  "heading": "<span>Results for #{@postcode.upcase}</span>"
              }
          },
          {
              "name": "block",
              "data": {
                  "css_class": "block",
                  "components": [
                      {
                          "name": "heading",
                          "data": {
                              "weight": 2,
                              "heading": "<a href='/constituencies/#{@constituency.graph_id}'>#{@constituency.name}</a>"
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
                                                      "weight": 2,
                                                      "heading": "<a href='/people/#{@person.first.graph_id}'>#{@person.first.display_name}</a>"
                                                  }
                                              },
                                              {
                                                  "name": "paragraph",
                                                  "data": {
                                                      "text": [
                                                          "MP for #{@person.first.current_seat_incumbency&.constituency&.name}",
                                                          "#{@person.first.try(:current_party).try(:name)}"
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
          {
              "name": "paragraph",
              "data": {
                  "text": [
                      "<a href='/postcodes'>Check for a different postcode</a>"
                  ]
              }
          }
      ]
    end

    def title
      'Find your constituency'
    end

  end
end