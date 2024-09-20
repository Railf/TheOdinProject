def substrings(string, dictionary)
  words = string.downcase.split()

  substrings = words.reduce(Hash.new(0)) do |substrings, word|

    dictionary.each do |word_in_dictionary|

      if word.include?(word_in_dictionary)
        substrings[word_in_dictionary] += 1
      else
        substrings[word_in_dictionary] += 0
      end
    end

    substrings
  end

  puts substrings.select {|key, value| value > 0 }
end


dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

substrings("below", dictionary)
# => { "below" => 1, "low" => 1 }

substrings("Howdy partner, sit down! How's it going?", dictionary)
# => { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }