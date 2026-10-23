use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
import lists as L 
import math as M

fun points(s :: String) -> Number: 
  doc: "given a notation about the game it will return the number of points that were awarded" 
  if 
    s == "W"  :3
  else if 
    s == "T"  :1 
  else: 
    0
  end 
where: 
  points("W") is 3 
  points("T") is 1 
  points("L") is 0 
end 

fun point-list(string-list :: List<String>) -> List<Number>:
  doc: "given a list of wins, loses or ties it returns the amount points awared in each of those games throughout the season" 
  L.map(points, string-list) 
where: 
  point-list([list: "W", "L", "T"]) is [list: 3, 0, 1] 
end 

    # we often have a situation that we have defined that can transform one item for them and then we then have a list of the item we have defined and we want to transform each element in the list in the same way -> the helper for this is map, which takes a function and does that function to every item in the list 
    #L.map(func, list) 


fun points-after-each(slist :: List<String>) -> List<Number>block: 
  doc: "given the season record it adds all the points awared as the season progresses"
  nlist = point-list(slist) 
  var total = 0 
  var soccer-list = [list: ] 
  for each(p from nlist)block: 
    total := total + p 
    soccer-list := soccer-list + [list: total] 
  end 
  soccer-list
where: 
  points-after-each([list: "W"]) is [list: 3] 
  points-after-each([list: "W", "T"]) is [list: 3, 4] 
end 
  
# in this function when we want to accumulate a list -> use more than one variable 

# use block to note that you are creating a function with mutiple things in it 

fall = table: opponent, result
  row: "A", "W"
  row: "B", "L"
  row: "C", "T"
  row: "D", "W"
  row: "E", "T"
  row: "F", "W"
end

fun season-report(t :: Table) -> String: 
  doc: "given a table, the function will them summarize all the points in a table in one line and also note how many ties the team had" 
  
  resultt = get-column(t, "result") 
  
  points-together = point-list(resultt) 
  
  points-added = M.sum(points-together) 
  
  teams = get-column(t, "opponent") 
  
  teams-number = L.length(teams) 
  
  fun find-tie(s :: String) -> Boolean: 
    if 
      s == "T" : true 
    else: 
      false 
    end 
  end
  
  just-tie = L.filter(find-tie, resultt) 
  
  tie-number = L.length(just-tie) 
  
  "Points: " + num-to-string(points-added) + ", games: " + num-to-string(teams-number) + ", ties: " + num-to-string(tie-number)
end 