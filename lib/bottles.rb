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
        "#{count_bottles(number)} of beer.\n" +
        'Go to the store and buy some more, ' +
        "#{count_bottles(99)} of beer on the wall.\n"
    else
      "#{count_bottles(number)} of beer on the wall, " +
        "#{count_bottles(number)} of beer.\n" +
        "#{take_down(number)} and pass it around, " +
        "#{count_bottles(number - 1)} of beer on the wall.\n"
    end
  end

  def take_down(number)
    case number
    when 1
      'Take it down'
    else
      'Take one down'
    end
  end

  def count_bottles(number)
    case number
    when 0
      'no more bottles'
    when 1
      "#{number} bottle"
    else
      "#{number} bottles"
    end
  end
end