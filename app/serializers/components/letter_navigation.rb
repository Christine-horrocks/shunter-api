module Serializers
  class LetterNavigation < Base

    def initialize(letters, active_letter)
      @letters = letters
      @active_letter = active_letter
    end

    def content
      ("A".."Z").map do |letter|
        presence = @letters.include?(letter) ? true : nil

        { letter: letter, presence: presence, active: active?(letter)}
      end
    end

    private 

    def active?(letter)
     letter == @active_letter.upcase ? true : nil
    end

  end
end