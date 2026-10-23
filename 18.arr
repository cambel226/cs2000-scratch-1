use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

include csv
#| Structured Data -> Tables are an example of structured data, lists are an example 
How do we define our own structured data, the data we want to define is...: 
   -  data that has mutiple parts
   -  a fixed number of parts
   Pyret has a language feature called data that allows us to find data that has not existed before -> these are all uppercase |# 

# First right the type of data and then construct an example of this data -> create a constructor (function that is an example of the data) 

data BookRecord: 
  | book(title :: String, author :: String, pages :: Number)
end

# this is creation of a new type of data 

dispossesssed = book("The Dispossessed", "Ursula K. Le Guim", 387) 

lighthouse = book("The Lighthouse", "Virginia Wolf", 209)

# We want to be able to extract out of this construction of data specific pieces just as a column or a row can be extracted from a table 

#| writing the name from the data function adding a period and then writing the piece of data you want extracts it ->     - name.piece of data -> dispossessed.title |# 

fun f(b :: BookRecord) -> String: 
  b.author 
end 



recipes-raw = load-table:
  title :: String,
  servings :: String,
  prep-time :: String
  source: csv-table-url("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/support/5-recipes.csv", default-options)
end
recipes-with-servings = transform-column(recipes-raw, "servings", string-to-number-default(0))
recipes = transform-column(recipes-with-servings, "prep-time", string-to-number-default(0))


data Recipe: 
  | recipe(title :: String, servings :: String, prep-time :: String) 
end 

fun row-to-recipe(r :: Recipe 