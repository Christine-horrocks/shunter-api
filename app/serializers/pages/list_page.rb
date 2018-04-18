module Serializers
  class ListPage < Page
    # Instance of a list, that is generated using a list of provided objects
    #
    # @param objects [Array] Array of Grom::Nodes to be listed
    # @param klass [Class] Corresponding Serializers class that objects need to be an instance of
    # @param objects_name [String] How list of objects will be referred to in outgoing JSON
    # @param options [Hash] Hash of optional parameters, indicating whether or not feature should be included in outgoing JSON
    # @return [Object] Serializers::List object

    def initialize(objects, klass, objects_name, letters, active_letter, options = {})
      @objects = objects
      @klass = klass
      @objects_name = objects_name
      @options = options
      @letters = letters
      @active_letter = active_letter
    end

    def title
      "#{@objects_name.capitalize} A to Z showing results for #{@active_letter.capitalize}"
    end

    def content
      [
        { name: "letter-navigation",
          data: Serializers::LetterNavigation.new(@letters, @active_letter).to_h
        },
        {
          name: @objects_name,
          data: organise_objects
        }
      ]
    end

    def organise_objects
      objects_to_json = []
      @objects.each do |object|
        objects_to_json << @klass.new(object).to_h
      end
      objects_to_json
    end


  end
end
