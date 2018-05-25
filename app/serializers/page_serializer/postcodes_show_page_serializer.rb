module PageSerializer
  # Initialises all the components that are required for the Postcodes show page.
  class PostcodesShowPageSerializer < PageSerializer::BasePageSerializer
    def initialize(constituency)
      @constituency = constituency
    end

    private

    def content
      {
          "name": "section-primary",
          "data": {
              "components": [
                  {
                      "name": "heading",
                      "data": {
                          "weight": 1,
                          "heading": "<span>Results for EH11 2RQ</span>"
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
                                      "heading": "<a href='/constituencies/UGMAlxoh'>#{@constituency.name}</a>"
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
                                                              "heading": "<a href='/people/wVI7ebTP'>Joanna Cherry</a>"
                                                          }
                                                      },
                                                      {
                                                          "name": "paragraph",
                                                          "data": {
                                                              "text": [
                                                                  "MP for Edinburgh South West",
                                                                  "Scottish National Party"
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
          }
      }
    end

    def title
      'Find your constituency'
    end

  end
end