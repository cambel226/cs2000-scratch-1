use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

include csv 

orders = table: time :: String, amount :: Number
  row: "08:00", 10.50
  row: "09:30", 5.75
  row: "10:15", 8.00
  row: "11:00", 3.95
  row: "14:00", 4.95
  row: "16:45", 7.95
end

high-value-orders = table: time, amount 
  row: "08:00", 10.50 
  row: "10:15", 8.00 
end 

fun is-high-value(r :: Row) -> Boolean: 
  doc: "returns whether amount column is >= 8" 
  get-column(r , "amount") >= 8 
where: 
  is-high-value(get-row(orders, 2)) is true 
  is-high-value(get-row(orders, 3)) is false
end 

order-by(orders, "amount", false) 

fun is-morning(time :: Row) -> Boolean: 
  doc: "notes when a time is in the morning" 
  get-column(time, "time") <= "12:00" 
where: 
  is-morning(get-row(orders, 2)) is true 
  is-morning(get-row(orders, 5)) is false 
end 

morning-orders = filter-with(orders, is-morning) 

order-by(orders, "time", false) 

lmo = order-by(morning-orders, "time", false)

slmo = get-row(lmo, 0) 

 
Data-table = load-table: 
  Location :: String,  
  Subject :: String, 
  Date :: String    
  source:csv-table-url("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/support/7-photos.csv", default-options)
end

fun is-forest(r :: Row) -> Boolean: 
  doc: "find every subject that includes a forest" 
  get-column(r, "Subject") == "Forest" 
where: 
  is-forest(get-row(Data-table, 12)) is true 
  is-forest(get-row(Data-table, 13)) is false 
end 


forest-loc = filter-with(Data-table, is-forest) 
