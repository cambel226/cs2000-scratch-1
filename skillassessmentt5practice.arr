use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

# Using recursion, design a function count-warm that takes a list of numbers and returns a count of numbers greater than 70.

fun count-warm(lon :: List<Number>) -> Number: 
  doc: "..." 
  
  cases(List) lon: 
    | empty => 0 
    | link(first, rest) => 
      if first > 70 : 1 + count-warm(rest) 
      else: 
        count-warm(rest) 
      end 
  end 
  
where: 
  count-warm([list: ]) is 0 
  count-warm([list: 45, 76, 52, 81]) is 2 
  count-warm([list: 3, 71]) is 1 
end 

# Using recursion, design a function build-string that takes a list of strings and returns a single large string containing the original strings concatenated together in order. 

fun build-string(los :: List<String>) -> String: 
  doc: "...." 
  
  cases(List) los: 
    |empty => "" 
    |link(first, rest) => first + " " + build-string(rest)
  end 
  
  
where: 
  build-string([list: ]) is "" 
  build-string([list: "Hello", "bye", "yay"]) is "Hello bye yay " 
end 