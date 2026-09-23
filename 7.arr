use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

include csv

expense-table = table: Month :: String, Expense :: Number 
  row: "January", 6000 
  row: "Febuary", 7000
  row: "March", 8000 
end 

# every row has to have the same amount of columns - doesn't work without having all three factors accounted for

# tables can be the input and output of functions 

# we can add data from other platforms using include csv and then adding in the function itself <source: csv-table-url(add the website url here) 


workouts = table: date :: String, activity :: String, duration :: Number 
  row: "2026-04-01","Running", 30
  row: "2026-04-02", "Yoga", 35 
  row: "2026-04-03", "Cycling", 60
end 


recipes = load-table:
  title :: String,
  servings :: Number,
  prep-time :: Number
  source: csv-table-url("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/support/5-recipes.csv", default-options)
end

L-R-L = load-table: 
  date :: String,
  month :: String, 
  year :: Number,
  lower_lee_group :: Number, 
  lower_thames_group :: Number 
  source: csv-table-url("https://data.london.gov.uk/download/24ry5/778eefb5-8cef-4d16-a4c8-77dee7ce7e81/london_reservoir_levels.csv", default-options) 
end 

second-day-levels = get-row(L-R-L, 1)

years = get-column(second-day-levels, "year") 

lower_lee_group3 = get-column(get-row(L-R-L, 3), "lower_lee_group") 

table-length(L-R-L)

get-row(L-R-L, 90)

avg-llg = mean(L-R-L, "lower_lee_group")

#still to be determined is how to work with the mean function for the table 