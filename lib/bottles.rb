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
    "#{quentity(number).capitalize} #{container(number)} of beer on the wall, " +
      "#{quentity(number)} #{container(number)} of beer.\n" +
      "#{action(number)}, " +
      "#{quentity(successor(number))} #{container(successor(number))} of beer on the wall.\n"
  end

  def successor(number)
    number.zero? ? 99 : number - 1
  end

  def action(number)
    number.zero? ? 'Go to the store and buy some more' : "Take #{pronoun(number)} down and pass it around"
  end

  def quentity(number)
    number.zero? ? 'no more' : number.to_s
  end

  def pronoun(number)
    number == 1 ? 'it' : 'one'
  end

  def container(number)
    number == 1 ? 'bottle' : 'bottles'
  end
end