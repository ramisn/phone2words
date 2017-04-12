# Can be easily converted to class
module PhoneConverter

  @@number_map = {
    2 => %w(a b c),
    3 => %w(d e f),
    4 => %w(g h i),
    5 => %w(j k l),
    6 => %w(m n o),
    7 => %w(p q r s),
    8 => %w(t u v),
    9 => %w(w x y z)
  }

  @@dictionary = File.readlines('dictionary.txt').map{|w| w.strip}

  # Check if word eixsts in the dictionary
  def self.word_exists(word)
    uword = word.upcase
    w = @@dictionary.bsearch{|x| x>= uword }
    w == uword
  end

  # Convert phone to array of words. The element will be a whole word
  def self.phone2word(phone)
    combinations = nil
    phone.each_char do |num_char|
      codes = @@number_map[num_char.to_i]
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

  # Convert phone to array of elements. The element can be one word or word pair
  def self.phone2words(phone)
    last = phone.dup
    first = ''
    full_phone_words = phone2word(phone)
    all_words = full_phone_words
    while last.length>3 do
      first += last.slice!(0)
      next if first.length < 3
      first_words = phone2word(first)
      last_words = phone2word(last)

      if first_words.length>0 && last_words.length>0 #&& !full_phone_words.include?(first_words+last_words)
        combinations = first_words.product(last_words)
        all_words += combinations
      end
      # remove full_phone_words from all_words pairs
      all_words.select!{|e| !full_phone_words.include?(e[0]+e[1]) }
    end
    all_words
  end

end


