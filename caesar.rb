def cipher(string, displacement)
    string.gsub(/[a-zA-Z]/) do |char|
        offset = char.match?(/[a-z]/) ? 97 : 65
        ((char.ord + displacement - offset) % 26 + offset).chr
    end
end

p cipher("What a world", 5)