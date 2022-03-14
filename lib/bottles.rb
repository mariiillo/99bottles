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
    bottle_number = BottleNumber.new(number)
    newt_bottle_number = BottleNumber.new(bottle_number.successor)
    "#{bottle_number.quentity.capitalize} #{bottle_number.container} of beer on the wall, " +
      "#{bottle_number.quentity} #{bottle_number.container} of beer.\n" +
      "#{bottle_number.action}, " +
      "#{newt_bottle_number.quentity} #{newt_bottle_number.container} of beer on the wall.\n"
  end
end

class BottleNumber
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def successor
    number.zero? ? 99 : number - 1
  end

  def action
    number.zero? ? 'Go to the store and buy some more' : "Take #{pronoun} down and pass it around"
  end

  def quentity
    number.zero? ? 'no more' : number.to_s
  end

  def pronoun
    number == 1 ? 'it' : 'one'
  end

  def container
    number == 1 ? 'bottle' : 'bottles'
  end
end