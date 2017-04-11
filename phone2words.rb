$number_map = {
  2 => %w(a b c),
  3 => %w(d e f),
  4 => %w(g h i),
  5 => %w(j k l),
  6 => %w(m n o),
  7 => %w(p q r s),
  8 => %w(t u v),
  9 => %w(w x y z)
}

$dictionary = File.readlines('words.txt').map{|w| w.strip}

def word_exists(word)
  $dictionary.index(word)
end

# Return array of first possible words and rest of phone string
def first_words(phone)
  num = ''
  while phone!='' do
    num = num + phone.slice!(0)
    next if num.length < 3
    p num
    combinations = nil
    num.each_char do |num_char|
      codes = $number_map[num_char.to_i]
      raise "Invalid symbol '#{num_char}' in the phone" if codes.nil?
      if combinations
        combinations = combinations.product(codes)
      else
        combinations = codes
      end
    end
    test_words = combinations.map { |e| e.flatten().join}
    words = test_words.select! { |w| word_exists(w) }
    #p "words #{words}"
    #break
    return words, phone
  end
end

p first_words('6686787825')
#p phone2words(6686787825)

