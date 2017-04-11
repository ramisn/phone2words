require 'set'

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

$dictionary = Set.new File.readlines('dictionary.txt').map{|w| w.strip}

def word_exists(word)
  $dictionary.include?(word.upcase)
end

def phone2word(phone)
  combinations = nil
  phone.each_char do |num_char|
    codes = $number_map[num_char.to_i]
    raise "Invalid symbol '#{num_char}' in the phone" if codes.nil?
    if combinations
      combinations = combinations.product(codes)
    else
      combinations = codes
    end
  end
  test_words = combinations.map { |e| e.flatten().join}
  test_words.select! { |w| word_exists(w) }
  test_words
end

#todo: make combinations of returned words
def phone2words(initial_phone)
  last = initial_phone.clone
  first = ''
  all_words = []
  while last.length>3 do
    first = first + last.slice!(0)
    next if first.length < 3
    first_words = phone2word(first)
    last_words = phone2word(last)
    if first_words.length>0 && last_words.length>0
      combinations = first_words.product(last_words)
      all_words = all_words + combinations
    end
  end
  all_words
end

p phone2words('2282668687')

