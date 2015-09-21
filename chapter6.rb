=begin
bottles = 99
while bottles != 0
  puts bottles.to_s + " bottles of beer on the wall, " + bottles.to_s + " bottles of beer."
  bottles -= 1
  if bottles != 0
    puts "Take one down and pass it around, " + bottles.to_s + " bottles of beer on the wall."
  else
    puts "Take one down and pass it around, no more bottles of beer on the wall."
  end
  puts ""
end

puts "No more bottles of beer on the wall, no more bottles of beer"
puts "Go to the store and buy some more, 99 bottles of beer on the wall."
=end

=begin
Write a Deaf Grandma program.
Whatever you say to grandma (whatever you type in), she should respond with HUH?!  SPEAK UP, SONNY!,
unless you shout it (type in all capitals).
If you shout, she can hear you (or at least she thinks so) and yells back, NO, NOT SINCE 1938!
To make your program really believable, have grandma shout a different year each time;
maybe any year at random between 1930 and 1950.
(This part is optional, and would be much easier if you read the section on Ruby's random number generator at the end of the methods chapter.)
You can't stop talking to grandma until you shout BYE.
Hint: Don't forget about chomp! 'BYE'with an Enter is not the same as 'BYE' without one!
Hint 2: Try to think about what parts of your program should happen over and over again. All of those should be in your while loop.
=end

=begin
bye = false
say = ""

while !bye
  puts "say something to Grandma? "
  say = gets.chomp

  if say != "BYE"
    if say.upcase != say
      puts "HUH?!  SPEAK UP, SONNY! "
    else
      year = 1930 + rand(21)
      puts "NO, NOT SINCE " + year.to_s
    end
  else
    bye = !bye
  end
end
=end

=begin
Extend your Deaf Grandma program: What if grandma doesn't want you to leave?
When you shout BYE, she could pretend not to hear you.
Change your previous program so that you have to shout BYE three times in a row.
Make sure to test your program: if you shout BYE three times, but not in a row, you should still be talking to grandma.
=end

=begin
bye = 3
say = ""

while bye > 0
  puts "say something to Grandma? "
  say = gets.chomp

  if say != "BYE"
    bye = 3
    if say.upcase != say
      puts "HUH?!  SPEAK UP, SONNY! "
    else
      year = 1930 + rand(21)
      puts "NO, NOT SINCE " + year.to_s
    end
  else
    bye -= 1
  end
end
=end

=begin
Write a program which will ask for a starting year and an ending year,
and then puts all of the leap years between them
(and including them, if they are also leap years).
Leap years are years divisible by four (like 1984 and 2004).
However, years divisible by 100 are not leap years (such as 1800 and 1900)
unless they are divisible by 400 (like 1600 and 2000, which were in fact leap years).
=end

first = 0
last = 0

puts "Enter first year? "
first = gets.chomp.to_i
puts "Enter last year? "
last = gets.chomp.to_i

year = first

while year <= last
  leap = false
  if year%4 == 0
    # could be a leap year
    if year%100 == 0
      # possibly not a leap year
      if year%400 == 0
        leap = true
      end
    else
      leap = true
    end
  end
  if leap
    puts year
  end
  year +=1
end
