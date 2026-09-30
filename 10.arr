use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")


# tests are meant to act as a failsafe in coding so that we become aware if our code is broken - we want to ensure that you've written enough test to make sure that you can properly display that the code works 

# last couple classes have introduced the different table functions we have 
# today is about writing them more compactly and quicker 

t = table: x-coord :: Number, y-coord :: Number
  row: 1, 2
  row: 3, 4
end
transform-column(t, "x-coord", lam(n :: Number) -> Number: n - 1 end)

# need a function to pass an arithmatic expression so that this table will work -> is there a qucker way to do this 

# Yes, instead we should define the table more compactly, we can define a simple function without naming it = Lambda Function. We dont need test for lambda because these test are supposed to be very simple
# lam(variable :: type annoatation) -> Return Type: variable + function end) 

# You can design a function that produces a table that reduces the cost of an item 

fun apply-discount(tab :: Table) -> Table: 
  doc: "reduces 'price' column by 20%" 
  transform-column(tab, "price", lam(p) : p * 0.8 end) 
where: 
  test-table = table: price 
    row: 50 
    row: 100
  end 
  test-output = table: price 
    row: 40 
    row: 80 
  end 
apply-discount(test-table) is test-output end 

# add more complexcity to a test by adding more to a singualr test rarher then adding a lot of tests 

prices = table: price
      row: 50
      row: 120
      row: 80
      row: 40
      row: 50
      row: 80
      row: 80
    end


# Problem 1 
# Design a function that takes a table that has a "price" column and adds a new column "tax", which is the sales tax amount (look up the sales tax where you are; to calculate the sales tax rate, multiply that by the price. If you live somewhere with no sales tax, you can use 5%). You can assume there is not already a tax column


PT = table: price :: Number 
  row: 10 
  row: 25 
  row: 34.5
  row: 50 
end 

fun calc-tax(r :: Row) -> Number: 
  doc: "calculate state tax on price of item"
  ((get-column(r, "price") * 0.0625) + (get-column(r, "price")))
where: 
  calc-tax(get-row(PT,0)) is 10.625
end 

#need to figure out the difference between build and transform column 

# Problem 2 
#What type of information is shared?

#Who is the subject of the information?	

#Who is the sender of the information?	

#Who are the potential recipients of the information?	

#What principles govern the collection and transmission of this information?