=begin
One billion seconds... Find out the exact second you were born (if you can).
Figure out when you will turn (or perhaps when you did turn?) one billion seconds old.
Then go mark your calendar.
=end

#my date of birth
dob = Time.new(1961, 06, 16, 18, 30)

# add a billion seconds
date_billion_seconds = dob + 1000000000

puts "I turned one billion seconmds old on date_billion_seconds " + (dob + 1000000000).to_s

=begin
Happy Birthday! Ask what year a person was born in, then the month, then the day.
Figure out how old they are and give them a big SPANK! for each birthday they have had.
=end

puts"What year were you born in? "
dob_year = gets.chomp.to_i
puts"What month were you born in? "
dob_month = gets.chomp.to_i
puts"What day were your born on? "
dob_day = gets.chomp.to_i

year = dob_year +1

while Time.new(year, dob_month, dob_day) < Time.now
  puts "BUMP!"
  year += 1
end

