class Player

  attr_reader :board

    def initialize(board)
      @board = board
      @cruiser = Ship.new('cruiser', 3)
      @submarine = Ship.new('submarine', 2)
    end

    def ship_placement
    end

end
