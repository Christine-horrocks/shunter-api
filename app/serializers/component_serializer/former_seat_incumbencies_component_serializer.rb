module ComponentSerializer
  class FormerSeatIncumbenciesComponentSerializer <BaseComponentSerializer

    def initialize(seat_incumbencies)
      @seat_incumbencies = seat_incumbencies
    end

    def name
      "former-seat-incumbencies"
    end

    def data
        {
          "title": "Former MPs",
          "former-seat-incumbency-list": former_seat_incumbency_list
        }
    end

    def former_seat_incumbency_list
      @seat_incumbencies.map do |seat_inbency|
        {
          "display_name": seat_inbency.member.display_name,
          "graph_id": seat_inbency.member.graph_id,
          "date_range": seat_inbency.date_range
        }
      end
    end


  end
end
