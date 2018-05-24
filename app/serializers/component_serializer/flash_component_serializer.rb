module ComponentSerializer
  class FlashComponentSerializer < BaseComponentSerializer
    # Initialise a flash component with a piece of text.
    #
    # @param [String] message string of text to be shown as a flash message.
    def initialize(message)
      @message = message
    end

    private

    def name
      "flash"
    end

    def data
      @message
    end
  end
end