module ComponentSerializer
  class InputComponentSerializer < BaseComponentSerializer

    def initialize(type: nil, name: nil, id: nil, maxlength: nil, pattern: nil, value: nil)
      @type = type
      @name = name
      @id = id
      @maxlength = maxlength
      @pattern = pattern
      @value = value
    end

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