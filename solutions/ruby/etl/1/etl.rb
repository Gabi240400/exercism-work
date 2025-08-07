module ETL
  def self.transform(old_format)
    new_format = {}
    old_format.each do |point, letters|
      letters.map!(&:downcase)
      letters.each { |letter| new_format[letter] = point }
    end
    new_format
  end
end
