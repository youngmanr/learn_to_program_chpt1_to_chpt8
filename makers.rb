name = "Rob"

def upper(string)
  string.upcase
end

def lower(string)
  string.downcase
end

def random_name
  ["Rob", "Jordan"].shuffle.first
end

def random_case(name)
  names = [name.upcase, name.downcase]
  names.shuffle.first
end

def random_both
  random_case(random_name)
end

puts "Hello #{random_both()}"

# random_both should return one of the following objects at RANDOM:

# ROB
# rob
# JORDAN
# jordan
# Hint: .shuffle will randomly mix the objects in an array

