=begin
Write your code for the 'Twelve Days' exercise in this file. Make the tests in
`twelve_days_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/twelve-days` directory.
=end

module TwelveDays
  def self.song
    song = ""
    12.times do |time|
      song << "#{beginning_sentence(ordinal_numerals[time + 1])}"
      items = time + 1
      if items == 1
        song << "#{phrases[items]}.\n\n"
      else
        while items > 0
          if items > 1
            song << "#{phrases[items]}, "
          else
            song << "and #{phrases[items]}.\n\n"
          end
          items -= 1
        end
      end
    end
    song[..-2] # removing the last \n
  end

  def self.phrases
    {
      1 => 'a Partridge in a Pear Tree',
      2 => 'two Turtle Doves',
      3 => 'three French Hens',
      4 => 'four Calling Birds',
      5 => 'five Gold Rings',
      6 => 'six Geese-a-Laying',
      7 => 'seven Swans-a-Swimming',
      8 => 'eight Maids-a-Milking',
      9 => 'nine Ladies Dancing',
      10 => 'ten Lords-a-Leaping',
      11 => 'eleven Pipers Piping',
      12 => 'twelve Drummers Drumming'
    }
  end

  def self.ordinal_numerals
    {
      1 => 'first',
      2 => 'second',
      3 => 'third',
      4 => 'fourth',
      5 => 'fifth',
      6 => 'sixth',
      7 => 'seventh',
      8 => 'eighth',
      9 => 'ninth',
      10 => 'tenth',
      11 => 'eleventh',
      12 => 'twelfth'
    }
  end

  def self.beginning_sentence(day)
    "On the #{day} day of Christmas my true love gave to me: "
  end
end
