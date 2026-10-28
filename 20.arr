use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")


# the first observation is that lists are actually made up of 2 different parts 
# the first element -> 1 
# the rest of the list -> 2 

#l = [list: 1,2,3]

#| data List: 
  | empty => 0 
  | link(f :: A , r :: List<A>)
   end |#

# design a function that takes a lists of numbers and adds up every number and end if you ever hit a 0 


fun add-till-zero(l :: List<Number>) -> Number: 
  doc: "adds numbers untill first zero in list" 
  cases(List) l: 
    | empty => 0
    | link(f, r) =>
      if f == 0: 
        0 
      else: 
        f + add-till-zero(r) 
      # if the first is 0, return 0 
      # otherwise, looks like first plus calling function on rest 
  end
  end

where:
  add-till-zero([list: 7, 3, 0, 5]) is 
    [list: 7, 3, 0, 5].first + add-till-zero([list: 7, 3, 0, 5].rest)
  add-till-zero([list:    3, 0, 5]) is     
    [list: 3, 0, 5].first + add-till-zero([list: 3, 0, 5].rest)
  add-till-zero([list:       0, 5]) is 0
  add-till-zero([list:])            is 0
end