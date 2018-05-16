module ComponentSerializer
  class SubheadingComponentSerializer < BaseComponentSerializer
    def initialize(person)
      @person = person
    end

    private

    def name
      "subheading"
    end

    def data
      subheading
    end

    def subheading
      subheading = t('.former_mp') if @person.former_mp?
      subheading = t('.former_lord') if @person.former_lord?
      subheading = "#{@person.current_party_membership.try(&:party).try(&:name)} #{t('.people.show.mp_for')} #{@person.current_seat_incumbency.constituency.name}" if @person.current_mp?
      subheading = "#{@person.current_party_membership.try(&:party).try(&:name)} - #{@person.statuses[:house_membership_status].join( t('.and') )}" if @person.current_lord?
      subheading
    end
  end
end
