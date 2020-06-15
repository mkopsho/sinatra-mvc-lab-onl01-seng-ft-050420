class PigLatinizer
  attr_accessor :word

  def initialize(word = nil)
    @word = word
  end

  def piglatinize(word)
    alphabet = ("a".."z").to_a + ("A".."Z").to_a
    vowels = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
    consonants = alphabet - vowels
    words = word.split(" ")
    latinized = []
    
    words.each do |word|
      if vowels.include?(word[0])
        latin = "#{word}way"
        latinized << latin
      elsif consonants.include?(word[0]) && consonants.include?(word[1]) && consonants.include?(word[2])
        latin = "#{word[3..-1]}#{word[0..2]}ay"
        latinized << latin
      elsif consonants.include?(word[0]) && consonants.include?(word[1])
        latin = "#{word[2..-1]}#{word[0..1]}ay"
        latinized << latin
      elsif consonants.include?(word[0])
        latin = "#{word[1..-1]}#{word[0]}ay"
        latinized << latin
      else
        word
      end
    end
    latinized.join(" ")
  end
end