class Ship

  attr_reader :name, :health, :sunk

  def initialize(name, health)
    @name = name
    @health = health
    @sunk = false
  end

  def length
    @health
  end

  def sunk?
    @sunk
  end

  def hit
    @health -= 1
    if @health == 0
      @sunk = true
    end  
  end
end
