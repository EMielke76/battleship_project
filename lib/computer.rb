class Computer

  attr_reader :board

  def initialize(board)
    @board = board
  end

  def letter_select
    letter = ("A".."D").to_a
    letter.sample
  end

  def number_select
    number = ("1".."4").to_a
    number.sample
  end

  def combined_select
    letter_select + number_select
  end
end
