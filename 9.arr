use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

# adding columns and transforming columns - using a new command : build-column 
# rough numbers vesus exact numbers are type of numbers 
# whole numbers are exact 
# numbers with decimals/fractions are rough
# use the operator is roughly 
# build column adds a column 
# transform column changes the value of an existing column 


  items = table: item :: String, x-coordinate :: Number, y-coordinate :: Number
    row: "Sword of Dawn",           23,  -87
    row: "Healing Potion",         -45,   12
  row: "Dragon Shield",           5,  -12
    row: "Magic Staff",             -9,   64
    row: "Elixir of Strength",      51,  -33
    row: "Cloak of Invisibility",  -66,    5
    row: "Ring of Fire",            38,  -92
    row: "Boots of Swiftness",     -17,   49
    row: "Amulet of Protection",    82,  -74
    row: "Orb of Wisdom",          -29,  -21
  end


fun calc-dist(r :: Row) -> Number: 
  doc: "calculate distance to origin using fileds 'x-coordinates' and 'y-coordinates'"
  num-sqrt(num-sqr(get-column(r, 'x-coordinate')) + num-sqr(get-column(r, 'y-coordinate')))
where:
  calc-dist(get-row(items, 2)) is-roughly 13 
end 

items-with-dist = build-column(items, "distance", calc-dist)

# looking at the table we image that these are coordinates for items in a video game relative to a player 
# if you want the table to track where the player moves you need to essentially add and subtract based on player movements 
# this function only tracks one movement in the x values that moves the player over 1 making it necessary to subtract 1 from all the x values

# Problem 1 
fun sub10p(n :: Number) -> Number: 
  doc:"subtracts 10 percent from input" 
  (n) - (n * 0.10)
where: 
  sub10p(10) is 9 
  sub10p(-3) is -2.7 
end 

items-shifted = transform-column(items, "x-coordinate", sub10p) 

items-moved = transform-column(items-shifted, "y-coordinate",sub10p)

# Problem 2 
items-rational-dist = transform-column(items-with-dist, "distance", num-to-rational) 