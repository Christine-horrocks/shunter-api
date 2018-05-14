module ComponentSerializer
  class LetterNavigationComponentSerializer < BaseComponentSerializer

    def initialize(letters, active_letter, objects_name = {})
      @letters = letters
      @active_letter = active_letter
      @objects_name = objects_name
    end

    private

    def name
      "letter-navigation"
    end
    def data
      ("A".."Z").map do |letter|
            presence = @letters.include?(letter) ? true : nil

            { letter: letter, presence: presence, active: active?(letter), objects_name: @objects_name}
          end
    end

    private

    def active?(letter)
     letter == @active_letter.upcase ? true : nil
    end

  end
end
