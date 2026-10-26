use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
# Talking about today = incompatiable types of data 
# The data takes different shapes or variants
# Express different possibility on different lines each starting with | for notation 

data PaymentMethod: 
  | cash
  | credit(card-number :: String, expiration :: String) 
  | checking(bank-account :: String, routing :: String, check-number :: Number) 
end 

#this is the complete definition of the data that includes many different forms 

payment1 = cash 

payment2 = credit("1111-1111-1111", "09/28")

payment3 = checking("001", "1111", 5) 

# as long as we know the type of data we are using we can use the dot notation to pull the data out 

payment2.expiration
payment3.routing

# if you write a function without knowing the type of data being used than we cannot use the dot notation 

# what I need to do to match conditional data is write a program that is able to function with conditional data -> Boolean is an example  

fun display-paymnt(pm :: PaymentMethod) -> String: 
  doc: "displays short summary of the payment method" 
  cases(PaymentMethod) pm: 
    | cash => "paid in cash" 
    | credit(cn, e) => "paid in credit expiring " + e  
    | checking(acc, rout, num) => "paid by check from account " + acc (PaymentMethod) pm: 
    | cash => "paid in cash" 
    | credit(cn, e) => "paid in credit expiring " + e  
    | checking(acc, rout, num) => "paid by check from account " + acc 
  end 
where: 
  display-paymnt(payment1) is "paid in cash" 
  display-paymnt(payment2) is "paid in credit expiring 09/28" 
  display-paymnt(payment3) is "paid by check from account 001" 
end 
# This function above is essentially the same as below ->

#| data Boolean: 
  | true 
  | false 
end 

if exp: 
  .....
else: 
  ....
end 
   equivalent to.. 
cases(Boolean) exp 
   | true => ... 
   | false =>... 
   end
|# 


#| string-to-number-unsafe 
   string-to-number-default(0)  = same thing as we have established |# 

data Vehicle: 
  | bike 
  | car(make :: String, year :: Number) 
  | truck(make :: String, year :: Number, capacity :: Number) 
end 

vehicle1 = bike 

vehicle2 = car("Toyota", 2019) 

vehicle3 = truck("Ford", 2025, 3) 

fun vehicle-age(va :: Vehicle, current-year :: Number) -> Number: 
  doc: "given a vehicles year and the current year the function will return how old the vehicle is" 
  cases(Vehicle) va: 
    | bike => 0 
    | car(m, y) => (current-year) - (y) 
    | truck(m, y, c)  => (current-year) - (y) 
  end 
where: 
  vehicle-age(vehicle2, 2026) is 7 
  vehicle-age(vehicle1, 2026) is 0 
  vehicle-age(vehicle3, 2026) is 1 
end 
  

data Grade: 
  | letter(gr :: String) 
  | percent(number :: Number)
  | pass-fail(passed :: Boolean) 
end 

grade1 = letter("A") 

grade2 = percent(89) 

grade3 = pass-fail(true) 

fun grade-to-gpa(g :: Grade) -> Number: 
  doc: "given a grade notation it will convert it to a 4.0 scale" 
  cases(Grade) g: 
    | letter(gr) =>
      if gr == "A" : 4.0 
      else if gr == "B" : 3.0
      else if gr == "C" : 2.0
      else if gr == "D" : 1.0
        else: 0.0 
      end
    | percent(n) => 
        if n >= 90: 4.0
        else if n <= 89 : 3.0
        else if n <= 79 : 2.0 
      else if n <= 69 : 1.0
        else:  0.0
      end
    | pass-fail(p) => 
      if p : 4.0
      else: 
        0.0
  end 
  end 
where: 
  grade-to-gpa(grade2) is 3.0 
  grade-to-gpa(grade1) is 4.0 
  grade-to-gpa(grade3) is 4.0 
   end  


fun payment-summary(pm :: PaymentMethod) -> String: 
  doc: "if given a certain payment method it will return a string depending on payment type" 
  cases(PaymentMethod) pm: 
    | cash => "cash payment" 
    | credit(cn, e) => "card ending in " + cn  
    | checking(acc, rout, num) => "Check #" + num
  end 
where: 
  payment-summary(payment1) is "cash payment" 
  payment-summary(payment2) is "card ending in 