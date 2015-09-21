=begin
Let's write a program which asks us to type in as many words as we want
(one word per line, continuing until we just press Enter on an empty line),
and which then repeats the words back to us in alphabetical order. OK?

word_array = []
word = ""

puts "Type in as many words as you want, one word per line"

word = gets.chomp
while word.length != 0
  word_array.push word
  word = gets.chomp
end

word_array.sort!
word_array.each { |w| puts w}
=end

=begin
Try writing the above program without using the sort method.
A large part of programming is solving problems, so get all the practice you can!


word_array = []
word = ""

puts "Type in as many words as you want, one word per line"

word = gets.chomp
while word.length != 0
  word_array.push word
  word = gets.chomp
end

sorting = true
length = word_array.length

while sorting
  sorting = false
  index = 0

  while index < (length -1)
    word_n = word_array[index]
    word_nn = word_array[index+1]

    if word_nn.to_s < word_n.to_s
      word_array[index] = word_nn
      word_array[index+1] = word_n
      sorting = true
    end
    index += 1
  end
end

word_array.each { |w| puts w}
=end

=begin
Rewrite your Table of Contents program (from the chapter on methods).
Start the program with an array holding all of the information for your Table of Contents (chapter names, page numbers, etc.).
Then print out the information from the array in a beautifully formatted Table of Contents.
=end

linewidth = 50
table_of_contents = [ ["numbers", 1], ["letters", 72], ["variables", 118]]

puts "Table of Contents".center(linewidth)

number = 1
table_of_contents.each {|chapter|
  title = "Chapter " + number.to_s + ": " + chapter[0].to_s
  page = "page " + chapter[1].to_s

  puts title.ljust(linewidth) + page.rjust(linewidth)
  number +=1
}
