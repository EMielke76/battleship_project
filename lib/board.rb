class Board

attr_reader :cells, :valid_horizontal, :valid_vertical

  def initialize
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4"),
    }
    # @valid_vertical = []
    # @cells.keys.each_cons(3) {|a| @valid_horizontal.push(a) }
    # @cells.keys.each_cons(2) {|a| @valid_horizontal.push(a) }
  end

  def valid_coordinate?(coordinate)
    @cells.has_key?(coordinate)
  end

  def valid_placement?(ship, coordinates)
    letters = coordinates.map {|coordinate| coordinate[0]}
    numbers = coordinates.map {|coordinate| coordinate[1].to_i}
    # require "pry"; binding.pry
    if ship.length != coordinates.length
      false
    elsif letters.uniq.length == 1 && (numbers.min..numbers.max).to_a == numbers
      true #letters are the same && numbers are sequential
    elsif (letters.min..letters.max).to_a == letters && numbers.uniq.length == 1
      true #letters are uniqiue and sequential && numbers are the same
    elsif (letters.min..letters.max).to_a == letters && (numbers.min..numbers.max).to_a == numbers
      false #Letters are sequential && numbers are sequential
    elsif letters.uniq.length == 1 && numbers.uniq.length == numbers
      false #letters are the same, numbers are the same
    else
      false
    end
  end

  def place(ship, coordinates)
    coordinates.map do |coordinate|
      @cells.each_pair do |coordinate, cell|
        coordinate = cell.place_ship(ship)

        end
      end
    end
  end
