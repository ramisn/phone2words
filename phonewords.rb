$words = File.read('words.txt')

def wordexists(word)
  $words =~ /#{word}/
end

p wordexists 'test'

