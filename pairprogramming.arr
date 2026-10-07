use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

fun pad2(n :: Number) -> String: 
  doc: "given a number between 0-59 and returns a string of that number, if the number is under 10 it adds a 0 in front" 
  if 
    n < 10 : "0" + num-to-string(n)
  else if 
    n <= 59 : num-to-string(n) 
  end 
where: 
  pad2(3) is "03" 
  pad2(11) is "11"
  pad2(54) is "54" 
end 
    

fun clock-hour(n :: Number) -> Number: 
  doc: "given a number 0-23 it returns a number 1-12 to mirror the notation of a clock" 
  if 
    n == 0 : 12
  else if 
    n <= 12 : n
  else: 
    n - 12 
  end 
where: 
  clock-hour(0) is 12 
  clock-hour(4) is 4 
  clock-hour(15) is 3 
end 
      
fun is-am(n :: Number) -> Boolean: 
  doc: "takes in a number 0-23 and outputs true or false based on it is 0-11 or 12-23" 
  if 
    n <= 11 : true 
  else if 
    n <= 23 : false 
  end 
where: 
  is-am(11) is true 
  is-am(20) is false 
end 

fun time-label(hour :: Number, minute :: Number) -> String: 
  doc: "given and hour and minute and then returns the specific hour and minute combined with am or pm noted" 
  num-to-string(clock-hour(hour)) + ":" + 
  pad2(minute) 
  + if 
    is-am(hour) : " AM"
  else: 
    " PM"
  end
where: 
  time-label(0, 5) is "12:05 AM" 
  time-label(9, 5) is "9:05 AM" 
  time-label(13, 30) is "1:30 PM" 
end

fun size-price(s :: String) -> Number: 
  doc: "notes the size of a pizza and then assigns the proper price" 
  if 
    s == "personal" : 8 
  else if 
    s == "large" : 14 
  end 
where: 
  size-price("personal") is 8 
end 

fun topping-price(n :: Number) -> Number: 
  doc: "adds up the price of toppings, the price only increases by 1.25 per topping after the 2 toppings have been added" 
  if 
    n <= 2 : 0 
  else:
    (n - 2) * (1.25) 
  end 
where: 
  topping-price(2) is 0 
  topping-price(4) is 2.50
end 

fun order-total(size :: String, topping :: Number, pickup :: Boolean) -> Number: 
  doc: "adds total price, topping price and determines if it is pickup or not, which then subtracts 2 from the price if it is" 
  size-price(size) + 
  topping-price(topping) 
    + if 
    pickup == true : -2
  else: 
    0 
  end 
where: 
  order-total("personal", 2, true) is 6
  order-total("large", 3, false) is 15.25 
end 