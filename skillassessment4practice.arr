use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

#Design a data definition for Beverage that can be either coffee with number of shots of espresso, or tea with name and brew-time in minutes. Then, write a function is-strong that returns true if the beverage is a coffee with more than 2 shots, or a tea brewed for more than 5 minutes.

data Beverage: 
  | coffee(SoE :: Number) 
  | tea(name :: String, brew-time :: Number) 
end 

beverage1 = coffee(1) 

beverage2 = tea("hibiscus", 4) 

beverage3 = coffee(3) 

beverage4 = tea("mint", 5) 

fun is-strong(b :: Beverage) -> Boolean: 
  doc: "given data about a beverage, it will return true if the beverage is a coffee with more than 2 shots of espresso or a tea brewed for more than 5 minutes" 
  cases (Beverage) b: 
    | coffee(SoE) => SoE > 2 
    | tea(n, b-t) => b-t > 5 
  end 
where: 
  is-strong(beverage1) is false 
  is-strong(beverage2) is false 
  is-strong(beverage3) is true 
end 

#Design a data definition for Restaurant that can be either yahoo with name and stars, or health-score with name and score. Then, write a function is-reputable that returns true if the resturant is a yahoo with at least 4 stars, or a health-score with score at least 85.

data Restaurant: 
  | yahoo(name :: String, stars :: Number) 
  | health-score(name :: String, score :: Number) 
end 

restaurant1 = yahoo("crispy dough", 5) 

restaurant2 = health-score("tatte", 74) 

restaurant3 = yahoo("chipotle", 4) 

fun is-reputable(R :: Restaurant) -> Boolean: 
  doc: "given a restaurant review it resturns true if it is at least 4 stars or a score higher than 85" 
  cases (Restaurant) R: 
    | yahoo(n, ss) => ss >= 4 
    | health-score(n, s) => s >= 85 
  end 
where: 
  is-reputable(restaurant1) is true 
  is-reputable(restaurant2) is false 
  is-reputable(restaurant3) is true 
end 


data Book: 
  | rating(title :: String, Stars :: Number, Num-Reviews :: Number) 
  | sales-ranking(title :: String, Position :: Number) 
end 

book1 = rating("Crying in Hmart", 5, 456) 
book2 = rating("Romeo and Juliet", 5, 1100) 
book3 = sales-ranking("Moby Dick", 237) 

fun is-popular(B :: Book) -> Boolean: 
  doc: "...." 
  cases (Book) B: 
    | rating(t, ss, n-r) => n-r >= 500 
    | sales-ranking(t, p) => p < 500 
  end 
where: 
  is-popular(book1) is false 
  is-popular(book2) is true 
  is-popular(book3) is true
end 