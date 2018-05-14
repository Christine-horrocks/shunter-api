module PageSerializer
  class ListPageSerializer < PageSerializer::BasePageSerializer

    # Instance of a list, that is generated using a list of provided objects
    #
    # @param objects [Array] Array of Grom::Nodes to be listed
    # @param klass [Class] Corresponding Serializers class that objects need to be an instance of
    # @param objects_name [String] How list of objects will be referred to in outgoing JSON
    # @param options [Hash] Hash of optional parameters, indicating whether or not feature should be included in outgoing JSON
    # @return [Object] Serializers::List object

    def initialize(objects, klass, objects_name, letters, active_letter = "all", options = {})
      @objects = objects
      @klass = klass
      @objects_name = objects_name
      @letters = letters
      @active_letter = active_letter
      @options = options
    end

    private

    def title
      if @active_letter != "all"
        "#{@objects_name.capitalize} A to Z showing results for #{@active_letter.capitalize}"
      else
        "#{@objects_name.capitalize} - UK Parliament"
      end
    end

    def content
      c = []

      c << ComponentSerializer::ListTitleComponentSerializer.new(@objects_name).to_h
      c << ComponentSerializer::LetterNavigationComponentSerializer.new(@letters, @active_letter, @objects_name).to_h
      c <<  { name: @objects_name, data: organise_objects }

      c
    end

    def organise_objects
      @objects.map do |object|
        @klass.new(object).to_h
      end
    end

  end
end
