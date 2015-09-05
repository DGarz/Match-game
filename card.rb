class Card

  attr_accessor :value

  def initialize(value)
    @value = value
    @face_up = false
  end

  def reveal
    @face_up = true
    self
  end

  def hide
    @face_up = false
  end

  def ==(card)
    self.value == card.value
  end

  def to_s
    @face_up ? value : "X"
  end
end
