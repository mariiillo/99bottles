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
    case number
    when 0
      'No more bottles of beer on the wall, ' +
        "#{quentity(number)} bottles of beer.\n" +
        'Go to the store and buy some more, ' +
        "99 #{container(number)} of beer on the wall.\n"
    when 1
      "#{number} #{container(number)} of beer on the wall, " +
        "#{number} #{container(number)} of beer.\n" +
        "Take #{pronoun(number)} down and pass it around, " +
        "#{quentity(number - 1)} bottles of beer on the wall.\n"
    else
      "#{number} #{container(number)} of beer on the wall, " +
        "#{number} #{container(number)} of beer.\n" +
        "Take #{pronoun(number)} down and pass it around, " +
        "#{number - 1} #{container(number - 1)} of beer on the wall.\n"
    end
  end

  def quentity(number)
    if number == 0
      'no more'
    else
      number
    end
  end

  def pronoun(number)
    if number == 1
      'it'
    else
      'one'
    end
  end

  def container(number)
    if number == 1
      'bottle'
    else
      'bottles'
    end
  end
end