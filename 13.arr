use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
include csv 
import math as M 
import statistics as S 

cafe-data =
  table: day :: String, drinks-sold :: Number
    row: "Mon", 45
    row: "Tue", 30
    row: "Wed", 55
    row: "Thu", 40
    row: "Fri", 60
  end

# Extracting columns -> get-column(cafe-data, "drinks-sold") used to extract singular row of data. Most of the functions are not built in so we have to include specific function librarys 

# if you import functions you ned to include a name - import math as "" 

sales = get-column(cafe-data, "drinks-sold") 
sales
M.sum(sales)
M.max(sales) 
S.mean(sales) 

# write notation and construct list, list can any type of data 

day = get-column(cafe-data, "day") 
day
M.min(day)

quiz-scores =
  table: student :: String, quiz1 :: Number, quiz2 :: Number, quiz3 :: Number
    row: "Alice", 85, 92, 78
    row: "Bob", 90, 88, 95
    row: "Charlie", 78, 85, 82
    row: "Diana", 95, 90, 88
  end

Q1 = get-column(quiz-scores, "quiz1")
Q1
S.mean(Q1) 

Q2 = get-column(quiz-scores, "quiz2")
Q2
S.mean(Q2)

Q3 = get-column(quiz-scores, "quiz3")
Q3
S.mean(Q3)

#Q2 has the highest average 

list1 = [list: 12, 8, 15, 22, 5, 18]

M.min(list1) 
M.max(list1) 
M.sum(list1) 
# range is 17 

E-data = load-table: NAME :: String, DEPARTMENT_NAME :: String, TITLE :: String, REGULAR :: String, RETRO :: String, OTHER :: String, OVERTIME :: String, INJURED :: String, DETAIL :: String, QUINN_EDUCATION :: String, TOTAL-GROSS :: String, POSTAL :: String 
  source: csv-table-url("https://data.boston.gov/dataset/418983dc-7cae-42bb-88e4-d56f5adcf869/resource/29b3544f-752a-4cb1-a6af-a1de153d20a0/download/employee-earnings-report-2025.csv", default-options)
end 

fun earnings-to-number(s :: String) -> Number:
  doc: "Converts a possibly comma-formatted earnings string to a number, using 0 if empty or invalid"
  string-to-number-default(0)(string-replace(s, ",", ""))
where:
  earnings-to-number("1234") is 1234
  earnings-to-number("1,234") is 1234
  earnings-to-number("-1.3") is -1.3
  earnings-to-number("hello") is 0
end

RND = transform-column(E-data, "REGULAR", earnings-to-number) 


Salary1 = get-column(RND, "REGULAR") 
Salary1
S.mean(Salary1) 