use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
import lists as L 
include csv 

# more operations on lists, moving away from list simply being columns and table, we now can find lists in other ares

discount-codes = [list: "NEWYEAR", "student", "NONE", "student", "VIP", "none"]

# first we would want to get rid of duplicates
# go to pyret documentation to find list functions -> you can use functions like get or set 
# the function <distinct> - given a list, returns a new list containing only one copy of each element that is duplicated in the list 

unique-codes = L.distinct(discount-codes) 

# We also have operations on lists that are similar to operations you saw previously on tables. For example, we can L.filter to remove codes that represent no discount like the filter-with function (in this case, normalized "none").

fun is-real-code(code :: String) -> Boolean:
  not(string-to-lower(code) == "none")
end

real-codes = L.filter(is-real-code, unique-codes)

# Like how tables have get-row, lists have a way of getting an element by position

first-code = L.get(real-codes, 0 ) 

# For tables, we had a few ways of transforming the existing data -- adding a new column with build-column, or transforming a single column with transform-column. Since lists have only a single value, there is only one version, called L.map.
# We can use this to, e.g., get lowercase versions of each discount code

lower-codes = L.map(string-to-lower, real-codes) 

# L.map is like filter in that it takes the function first 

# practice -> 

survey = [list: "yes", "NO", "maybe", "Yes", "no", "Maybe"]

unique-survey = L.distinct(survey)

lower-survey = L.map(string-to-lower, unique-survey) 

fun is-no-maybes(code :: String) -> Boolean:
  if
  code == "maybe" : false 
  else: 
  true 
end 
end

no-maybes = L.filter(is-no-maybes, lower-survey) 

products =
  table: name :: String, price :: Number
    row: "laptop", 999.99
    row: "mouse", 25.50
    row: "keyboard", 75.00
    row: "monitor", 299.99
  end

price-column = get-column(products, "price") 

fun less-than-100(p :: Number) -> Boolean: 
  doc: "gets prices that are less than 100" 
     p <= 100  
where: 
  less-than-100(98) is true 
  less-than-100(102) is false 
end  

is-cheap = L.filter(less-than-100, price-column)

employee-table = load-table: 
  



  


