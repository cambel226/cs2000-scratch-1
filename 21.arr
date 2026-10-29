use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

# If we want to represent something like a list, with the goal to define a data definition that can capture a list with 1 piece of data, no pieces of data or all the data 
# [list: 1, 2, 3], [list: 1], [list: ] 

# The challenge is that structured data is like rows, it has a given number of fields ->  list can have 3 fields, but it can also have 1 or 0 
# How do we tell the programming that the amount of fields shift 
# Structured dataa lone is not suffcient to describe a list, which is a finite collection with infinite possibilities 

# The other option then is to attempt to use conditional data instead 
# In all lists exists other lists -> [list: 1, 2, 3, 4], [list:   2, 3, 4], [list:     3, 4], [list:          4] 

# we are defining lists but while we are defining it we are also utilizing the definition -> recursive data 

# data List: 
# | make-list(first, rest :: List) 
# | empty  
#end 
# the list referred toat the bottom is the same list referred to at the top 

# [list: 4] -> make-list(4, ???) -> cannot put more make-list because their is not more first part of the list anymore, need to define empty to then stop the function from creating a never ending list 

# there has to be finite cases or cases where the list will end -> empty 
# need one cases that is also recursive 

# interesting thing about self-referential data is that it leads to the same expression in the code - usually you have a base case with an answer to the end of the list, in the recursive case you do something and then you call the function on the end of the list - there is a format 

data NumList:
  | nl-empty
  | nl-link(first :: Number, rest :: NumList)
end

nl-empty
nl-link(3, nl-empty)
nl-link(7, nl-link(3, nl-empty))
nl-link(2, nl-link(7, nl-link(3, nl-empty)))

# the template is beyond just needing to do case analysis but also the recursive data leads to recurisive code -> the template for recursive data looks like this : 

#|
fun num-list-fun(nl :: NumList) -> ???:
  cases (NumList) nl:
    | nl-empty => ...
    | nl-link(first, rest) =>
      ... first ...
      ... num-list-fun(rest) ...
  end
end
|#

# goal is to design function that counts the # of 7s

fun num-7s(l :: NumList) -> Number: 
  doc: "counts how many 7s"
  cases (NumList) l: 
    | nl-empty => 0 
    | nl-link(first, rest) => 
      if first == 7: 
        1 + num-7s(rest) # counts how many 7s in rest
      else: 
        0 + num-7s(rest)
      end 
  end
where: 
  num-7s(nl-empty) is 0 
  num-7s(nl-link(3, nl-empty)) is 0 
  num-7s(nl-link(7, nl-link(3, nl-empty))) is 1 
  num-7s(nl-link(2, nl-link(7, nl-link(3, nl-empty)))) is 1 
end 


fun contains-n(l :: NumList, n :: Number) -> Boolean: 
  doc: "given a numlist and a number it returns whether it is or isn't in the list" 
  cases (NumList) l: 
    | nl-empty => false 
    | nl-link(first, rest) => 
      if first == n: 
        true 
      else: 
        contains-n(rest, n) 
      end
  end 
where: 
  contains-n(nl-empty, 0) is false 
  contains-n(nl-link(3, nl-empty), 0) is false
  contains-n(nl-link(0, nl-link(3, nl-empty)), 0) is true 
end 
  
fun total-sum(l :: NumList) -> Number: 
  doc: "when given a list it adds them all together and outputs the sum" 
  cases (NumList) l: 
    | nl-empty => 0 
    | nl-link(first, rest) => 
      first + total-sum(rest) 
  end 
where: 
  total-sum(nl-empty) is 0 
  total-sum(nl-link(3, nl-link(7, nl-empty))) is 10 
end 

fun remove-3(l :: NumList) -> List: 
  doc: "given a list, if it includes the #3 it removes that number" 
  cases (NumList) l:
    | nl-empty => [list: ]  
    | nl-link(first, rest) => 
      if first == 3: remove-3(rest) 
      else: 
        [list: first] + remove-3(rest) 
      end 
  end 
where: 
  remove-3(nl-link(3, nl-empty)) is [list: ] 
  remove-3(nl-link(7, nl-link(3, nl-empty))) is [list: 7] 
end 