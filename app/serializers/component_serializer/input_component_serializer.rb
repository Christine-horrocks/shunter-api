module ComponentSerializer
  class InputComponentSerializer < BaseComponentSerializer
    # Initialise an input component with some optional information.
    #
    # @param [String] type the type of input.
    # @param [String] name the name of the input.
    # @param [String] id the id of the input.
    # @param [String] maxlength the maxlength of the input.
    # @param [String] pattern the pattern of the input.
    # @param [String] value the value of the input.
    # @param [String] label_text the label_text of the input.
    def initialize(type: nil, name: nil, id: nil, maxlength: nil, pattern: nil, value: nil, label_text: nil)
      @type = type
      @name = name
      @id = id
      @maxlength = maxlength
      @pattern = pattern
      @value = value
      @label_text = label_text
    end

    def content
      return content_with_label(super) if @label_text

      super
    end

    # Add a label component in front of our input
    #
    # @param [Hash] super_content The hash for our input component
    # @return [Array<Hash>] An array containing an input component's hash, followed by our input component
    def content_with_label(super_content)
      [
          ComponentSerializer::LabelComponentSerializer.new(@id, @label_text).to_h,
          super_content
      ]
    end

    private

    def name
      'input'
    end

    def data
      {}.tap do |hash|
        hash[:type] = @type if @type
        hash[:name] = @name if @name
        hash[:id] = @id if @id
        hash[:maxlength] = @maxlength if @maxlength
        hash[:pattern] = @pattern if @pattern
        hash[:value] = @value if @value
      end
    end
  end
end