$number_map = {
  2 => 'abc',
  3 => 'def',
  4 => 'ghi',
  5 => 'jkl',
  6 => 'mno',
  7 => 'pqrs',
  8 => 'tuv',
  9 => 'wxyz'
}

$words = File.read('words.txt')

def wordexists(word)
  $words =~ /#{word}/
end


def phone2words(phone)
  result = []
  phone = phone.to_s
  num = ''
  while phone!='' do
    num = num + phone.slice!(0)
    next if num.length < 3
    # test all words for s
    p num
    num.each_char do |num_char|
      code = $number_map[num_char.to_i]
      raise "Invalid symbol '#{num_char}' in the phone" if code.nil?
      code.each_char do |c|
      end
    end
  end
end


p phone2words(6686787825)

