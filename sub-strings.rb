def substrings(string, dictionary)
    words = string.downcase
    dictionary.each_with_object(Hash.new(0)) do |text, hash|
        amount = words.scan(text).length
        hash[text] = amount unless amount == 0
    end
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
p substrings("Howdy partner, sit down! How's it going?", dictionary)
p substrings("below", dictionary)