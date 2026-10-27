use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
# Talking about today = incompatiable types of data 
# The data takes different shapes or variants
# Express different possibility on different lines each starting with | for notation 

data PaymentMethod: 
  | cash
  | credit(card-number :: String, expiration :: String) 
  | checking(bank-account :: String, routing :: String, check-number :: String) 
end 

#this is the complete definition of the data that includes many different forms 

payment1 = cash 

payment2 = credit("1111", "09/28")

payment3 = checking("001", "1111", "5555") 

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


fun payment-summary(pms :: PaymentMethod) -> String: 
  doc: "if given a certain payment method it will return a string depending on payment type"
  cases(PaymentMethod) pms: 
    | cash => "cash payment" 
    | credit(cn, e) => "card ending in " + cn  
    | checking(acc, rout, num) => "check #" + num
  end 
where: 
  payment-summary(payment1) is "cash payment" 
  payment-summary(payment2) is "card ending in 1111"
  payment-summary(payment3) is "check #5555" 
end


data WeatherReport: 
  | sunny(temperature :: Number) 
  | rainy(temperature :: Number, percipitation-amount :: Number)
  | snowy(temperature :: Number, percipitation-amount :: Number, wind-speed :: Number) 
end

weather-report1 = sunny(98) 

weather-report2 = rainy(50, 3) 

weather-report3 = snowy(20, 4, 29) 


fun is-severe(wr :: WeatherReport) -> Boolean: 
  cases(WeatherReport) wr: 
    | sunny(t) => 
      if t > 95 : true 
      else: 
        false 
      end 
    | rainy(t, pa) => 
      if pa > 2 : true 
      else: 
        false 
      end 
    | snowy(t, pa, ws) => 
      if ws > 30 : true 
      else: 
        false 
      end 
  end
      where: 
      is-severe(weather-report1) is true 
      is-severe(weather-report2) is true 
      is-severe(weather-report3) is false 
    end 



