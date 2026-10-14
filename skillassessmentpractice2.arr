use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")


fun find-drought-risk(t :: Table) -> Table: 
  doc: "makes a table with only regions that have decreased in rainfall"

fun less-rain(r :: Row) -> Boolean: 
  doc: "if the amount decreases between 2023 and 2024 then it is true, the rest is false" 
   get-column(r, "rainfall-2023") > get-column(r,"rainfall-2024")
end 
  
  filter-with(t, less-rain) 
where: 
  rainforest-table = table: region :: String, rainfall-2023 :: Number, rainfall-2024 :: Number
  row: "one", 74, 56
  row: "four", 89, 112
  row: "seven", 45, 46
  row: "ten", 44, 43
end
  
  result = table: region, rainfall-2023, rainfall-2024
  row: "one", 74, 56
  row: "ten", 44, 43
end 
 
find-drought-risk(rainforest-table) is result 
end

# Design a function add-bad-year-column that, given a table with columns for year, costs, and revenues, adds a new column called "bad-year" that contains true if the costs exceed revenues for that year, and false otherwise.

fun add-bad-year-column(t :: Table) -> Table: 
  doc: "adds a new column to an exisiting table that notes whether the year was a good or bad year depending on if cost exceeds revenue" 
  
  fun is-bad-year(r :: Row) -> Boolean: 
    doc: "finds which years have the cost exceeding the revenue" 
    (get-column(r, "cost")) > (get-column(r, "revenue"))
  end 
  
  build-column(t, "bad-year", is-bad-year)  
where: 

  ft = table: year :: String, cost :: String, revenue :: String
  row: "2026", "55660", "70000" 
  row: "2025", "54000", "45000" 
  row: "2024", "40000", "45000"
end 

  result = table: year :: String, cost :: String, revenue :: String, bad-year :: Boolean 
    row: "2026", "55660", "70000", false 
    row: "2025", "54000", "45000", true
    row: "2024", "40000", "45000", false 
  end 
    
  add-bad-year-column(ft) is result
end 


ft2 = table: year :: String, cost :: String, revenue :: String
  row: "2026", "55660", "70000" 
  row: "2025", "54000", "45000" 
  row: "2024", "40000", "45000"
  row: "2023", "30000", "10000" 
  row: "2022", "15000", "15500" 
end 

# Design a function add-food-share-column that, given a sales table, returns a new table with an additional column called "food-share". For each row, this column should contain the fraction of that month's total sales (drinks plus food) that came from food.

sales = table: month, drinks, food
  row: "Jan", 1200, 400
  row: "Feb", 1100, 650
  row: "Mar", 1500, 300
  row: "Apr", 900, 700
end

