module ComponentSerializer
  class ConstituencyComponentSerializer <BaseComponentSerializer

    def initialize(constituency)
      @constituency = constituency
    end

    private

    def content
      hash = {
        "constituency_name": "#{@constituency.name}",
        "graph_id": "#{@constituency.graph_id}",
        "mp_display_name": "#{@constituency.current_member_display_name}",
        "party": "#{@constituency.current_member_party_name}"
      }
      hash
    end



  end
end
