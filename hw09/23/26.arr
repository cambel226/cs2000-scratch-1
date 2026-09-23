use context dcic2024

shuttle = table: month, riders
  row: "Jan", 1123
  row: "Feb", 1045 
  row: "Mar", 1087 
  row: "Apr", 999
end 

fun cleared-1K(r :: Row) -> Boolean: 
  doc: " determines whether the given row has at least 1000 riders" 
  if r ["riders"] >= 1000: 
    true 
  else: 
    false 
  end 
where: 
  cleared-1K(shuttle.row-n(2)) is true 
  cleared-1K(shuttle.row-n(3)) is false 
end 

fun is-winter(r :: Row) -> Boolean: 
  doc: "intersted in month column, outputs true if the month is Jan, Feb, or Mar"  
    if r ["month"] >= "Feb":
        true 
  else: 
    false
    or 
    if r ["month"] >= "Jan":
    true 
    else:
      false 
      or 
      if r ["month"] >= "Mar":
    true 
      else: false 
  end
    end
  end
where: 
is-winter(shuttle.row-n(0)) is true 
is-winter(shuttle.row-n(1)) is true 
is-winter(shuttle.row-n(2)) is true
is-winter(shuttle.row-n(3)) is false 
end 
   
  