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
    BottleVerse.new(number).lyrics
  end
end

class BottleVerse
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def lyrics
    bottle_number = BottleNumber.for(number)
    "#{bottle_number} of beer on the wall, ".capitalize +
      "#{bottle_number} of beer.\n" +
      "#{bottle_number.action}, " +
      "#{bottle_number.successor} of beer on the wall.\n"
  end
  
end

class BottleNumber
  def self.for(number)
    registry.find { |candidate| candidate.handles?(number) }.new(number)
  end

  def self.registry
    @registry ||= [BottleNumber]
  end

  def self.register(candidate)
    registry.prepend(candidate)
  end

  def self.inherited(candidate)
    register(candidate)
  end

  def self.handles?(_number)
    true
  end

  attr_reader :number
  def initialize(number)
    @number = number
  end

  def successor
    BottleNumber.for(number - 1)
  end

  def action
    "Take #{pronoun} down and pass it around"
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
  def self.handles?(number)
    number.zero?
  end

  def action
    'Go to the store and buy some more'
  end

  def quentity
    'no more'
  end

  def successor
    BottleNumber.for(99)
  end
end

class BottleNumber1 < BottleNumber
  def self.handles?(number)
    number == 1
  end

  def pronoun
    'it'
  end

  def container
    'bottle'
  end
end

class BottleNumber6 < BottleNumber
  def self.handles?(number)
    number == 6
  end

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