module ComponentSerializer
  class FormerSeatIncumbenciesComponentSerializer < BaseComponentSerializer
    def initialize(seat_incumbencies)
      @seat_incumbencies = seat_incumbencies
    end

    private

    def name
      "former-seat-incumbencies"
    end

    def data
        {
          "title": t('.former_mp_plural'),
          "former-seat-incumbency-list": former_seat_incumbency_list
        }
    end

    def former_seat_incumbency_list
      @seat_incumbencies.select { |seat_incumbency| seat_incumbency.current? == false }.map do |seat_incumbency|
        {
          "display_name": seat_incumbency.member.display_name,
          "graph_id": seat_incumbency.member.graph_id,
          "date_range": seat_incumbency.date_range
        }
      end
    end
  end
end
