use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

fun check-year(year :: Number) -> String:
  doc: "Returns 'Past', 'Current', or 'Future' depending on whether the year is before, equal to, or after 2026"
  if 
    year < 2026 : "Past" 
  else if 
    year > 2026 : "Future" 
  else: 
    "Current" 
  end 
where:
  check-year(2020) is "Past"
  check-year(2026) is "Current"
  check-year(2030) is "Future"
end



fun letter-grade(score :: Number) -> String:
  doc: "Returns the letter grade (A, B, C, D, or F) for a numeric score"
  if 
    score >= 90 : 
    "A" 
  else if 
    score >= 80 : 
    "B" 
  else if 
    score >= 70 : 
    "C" 
  else if 
    score >= 60 : 
    "D" 
  else: 
    "F"
  end
where:
  letter-grade(95) is "A"
  letter-grade(89) is "B"
  letter-grade(70) is "C"
  letter-grade(69) is "D"
  letter-grade(0) is "F"
end

# Design a function add-bad-year-column that, given a table with columns for year, costs, and revenues, adds a new column called "bad-year" that contains true if the costs exceed revenues for that year, and false otherwise.

TableBY = table: year :: Number, cost :: Number, revenue :: Number
  row: 1, 45, 50 
  row: 2, 100, 200 
  row: 3, 500, 2000
  row: 4, 700, 600 
end 

fun is-bad-year-fun(r :: Row) -> Boolean: 
  doc: "if the cost of the year exceeds the revenue for the year then the function will return true" 
  if 
    get-column(r, "cost") > get-column(r, "revenue") : 
    true 
  else: 
    false 
  end 
  where: 
  is-bad-year-fun(get-row(TableBY, 3)) is true 
  is-bad-year-fun(get-row(TableBY, 0)) is false 
end 
  
add-bad-year-column = build-column(TableBY, "is-bad-year",is-bad-year-fun)

Table = table: name :: String, GPA :: Number
  row: "Cammy", 3.91 
  row: "Isa", 3.49
  row: "Bailey", 3.20
end 

fun honor-student(r :: Row) -> Boolean: 
  doc: "when given a certain GPA it says true or false to note being an honors student" 
  if
    get-column(r, "GPA") >= 3.5 : true 
  else:
    false
  end 
where: 
  honor-student(get-row(Table, 0)) is true 
  honor-student(get-row(Table, 1)) is false 
end 

is-honor-student = filter-with(Table, honor-student) 