use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")



fun check-age(age :: Number) -> Boolean: 
  doc: "checks if the age is at or above 21 and notes true, if they are below notes false" 
  if
    age >= 21 : true  
  else: false 
  end 
where: 
  check-age(21) is true 
  check-age(10) is false 
  check-age(22) is true 
end 

fun check-year(year :: Number) -> String:
  doc: "Returns 'Past', 'Current', or 'Future' depending on whether the year is before, equal to, or after 2026"
    if year < 2026:
    "Past"
  else if year == 2026:
    "Current"
  else:
    "Future"
  end
where:
  check-year(2020) is "Past"
  check-year(2026) is "Current"
  check-year(2030) is "Future"
end