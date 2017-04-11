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

$dictionary = File.readlines('dictionary.txt').map{|w| w.strip}

def word_exists(word)
  $dictionary.index(word.upcase)
end

#todo: make combinations of returned words
def phone2words(initial_phone)
  phone = initial_phone.clone
  num = ''
  all_words = []
  while phone!='' do
    num = num + phone.slice!(0)
    next if num.length < 3
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
    if words.length>0
      if phone.length>0
        last_words = phone2words(phone)
        return [words]+[last_words] if last_words.length>0
      else
        return [words]
      end
    end
  end
  []
end

p phone2words('2282668687')

