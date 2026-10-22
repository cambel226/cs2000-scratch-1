use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")


use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

# Your project work here!

include csv 

data-table = load-table: 
  draw-date :: String, 
  Winning-Numbers :: String,
  Multiplier :: Number,
  double_play_winning_numbers :: String
  source:csv-table-url("https://data.ny.gov/api/v3/views/d6yy-54nr/export.csv?", default-options)
end

# I think that a question that could be answered based on this data table is examing if there is any emerging patterns in the winning lottery numbers. I think that information would possibly be able to help someone statisitcally choose a set of numbers that is more likely to win.
# link to data : https://catalog.data.gov/dataset/lottery-powerball-winning-numbers-beginning-2010

# I think that it is defintely possible that a string of numbers exists that is more likely to be pulled from this base of numbers. I think it would be possible for me to find a pattern in the list of numbers. 

# Question #2 : Is there any substantial difference between the double play winning numbers an dhte winning numbers / Can we identify any pattern 

# Question 3 : What has the pattern specifically looked like in 2026, how can we interpret that? 


counts = count(data-table, "Winning-Numbers")

table = freq-bar-chart(counts, "value")

# my inital attempts at isolating a date or singular value failed and thus may need to either be rethought or I need to find a different data set.

# I am making this extra file because my other project won't load! 

# I am attempting to find a differing data set to create questions for and then chart 

