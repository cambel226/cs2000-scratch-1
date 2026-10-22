use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

 var cnt = 0
fun every-third-element(lst :: List) -> List block:
  var output = [list: ]
  for each(elt from lst) block:
    when num-modulo(cnt, 3) == 0:
      output := output + [list: elt]
    end
    cnt := cnt + 1
  end
  output
where:
  every-third-element([list: ]) is [list: ] # cnt  = 0 , cnt = 2
  every-third-element([list: 1, 3, 5]) is [list: 1] # cnt = 3, cnt = 4
  every-third-element([list: 1,3,5,7,11]) is [list: 1, 7] # cnt = 9
   end 

#every-third-element([list: 1,3]) # cnt = 2 

# this is happening because cnt was not put inside the funtion and so it is operating in the global program directory - entering names into the function places the names into the local program directory 

# everytime we call this function we add to the same count rather than having it reset to 0. We need it to reset to 0 

# the tests worked because they happen to work in our favor not because the code was doing what we wanted it to 

# Pyret always runs our code before it runs the tests 
# MAKE SURE YOUR VARIABLES ARE INSIDE YOUR FUNCTIONS 



