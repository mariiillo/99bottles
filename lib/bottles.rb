class Bottles
  def song
    verses(99, 0)
  end

  def verses(start, finish)
    start.downto(finish).map do |number|
      verse(number)
    end.join("\n")
  end

  def verse(number)
    bottle_number = BottleNumber.for(number)
    "#{bottle_number} of beer on the wall, ".capitalize +
      "#{bottle_number} of beer.\n" +
      "#{bottle_number.action}, " +
      "#{bottle_number.successor} of beer on the wall.\n"
  end
end

class BottleNumber
  attr_reader :number

  def self.for(number)
    case number
    when 0
      BottleNumber0
    when 1
      BottleNumber1
    when 6
      BottleNumber6
    else
      BottleNumber
    end.new(number)
  end

  def initialize(number)
    @number = number
  end

  def successor
    BottleNumber.for(number - 1)
  end

  def action
    number.zero? ? 'Go to the store and buy some more' : "Take #{pronoun} down and pass it around"
  end

  def quentity
    number.to_s
  end

  def pronoun
    'one'
  end

  def container
    'bottles'
  end

  def to_s
    "#{quentity} #{container}"
  end
end

class BottleNumber0 < BottleNumber
  def quentity
    'no more'
  end

  def successor
    BottleNumber.for(99)
  end
end

class BottleNumber1 < BottleNumber
  def pronoun
    'it'
  end

  def container
    'bottle'
  end
end

class BottleNumber6 < BottleNumber
  def quentity
    1
  end

  def pronoun
    'one'
  end

  def container
    'six-pack'
  end
end