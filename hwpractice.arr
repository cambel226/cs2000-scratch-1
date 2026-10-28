use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
import lists as L


book-transactions = table: transaction-id, date-time, book-title, book-genres, total-amount
  row: "TXN001", "2024-10-01 14:23", "1984", "Fiction", 18.98
  row: "TXN002", "2024-10-01 16:45", "Crime and Punishment", "Fiction", 20.98
  row: "TXN003", "2024-10-02 09:12", "Where the Crawdads Sing", "Fiction", 19.98
  row: "TXN004", "2024-10-02 11:30", "Atomic Habits", "Self-Help", 22.98
  row: "TXN005", "2024-10-03 13:15", "Klara and the Sun", "Sci-Fi", 32.98
  row: "TXN006", "2024-10-03 15:42", "Project Hail Mary", "Sci-Fi", 34.98
  row: "TXN007", "2024-10-04 10:05", "Evicted", "Non-Fiction", 20.98
  row: "TXN008", "2024-10-04 12:18", "1984", "Fiction", 18.98
  row: "TXN009", "2024-10-05 14:33", "Atomic Habits", "Self-Help", 22.98
  row: "TXN010", "2024-10-05 16:20", "The Seven Husbands of Evelyn Hugo", "Fiction", 14.50
  row: "TXN011", "2024-10-06 08:45", "Educated", "Memoir", 17.25
  row: "TXN012", "2024-10-06 10:15", "Dune", "Sci-Fi", 29.99
  row: "TXN013", "2024-10-06 12:30", "The Midnight Library", "Fiction", 16.75
  row: "TXN014", "2024-10-07 09:00", "Sapiens", "Non-Fiction", 21.00
  row: "TXN015", "2024-10-07 11:45", "The Alchemist", "Fiction", 13.95
  row: "TXN016", "2024-10-07 14:20", "Becoming", "Memoir", 19.50
  row: "TXN017", "2024-10-08 07:30", "The Handmaid's Tale", "Fiction", 15.99
  row: "TXN018", "2024-10-08 13:15", "Thinking, Fast and Slow", "Psychology", 24.95
  row: "TXN019", "2024-10-08 15:40", "The Hobbit", "Fantasy", 12.99
  row: "TXN020", "2024-10-09 10:25", "Born a Crime", "Memoir", 18.00
  row: "TXN022", "2024-10-09 16:10", "Circe", "Fantasy", 26.50
  row: "TXN023", "2024-10-10 08:20", "The Power of Now", "Self-Help", 14.99
  row: "TXN024", "2024-10-10 11:35", "Normal People", "Fiction", 17.99
  row: "TXN025", "2024-10-10 14:45", "The Silent Patient", "Thriller", 23.50
  row: "TXN026", "2024-10-11 09:15", "Untamed", "Memoir", 20.25
  row: "TXN027", "2024-10-11 13:00", "The Thursday Murder Club", "Mystery", 22.75
  row: "TXN028", "2024-10-11 15:30", "Atomic Habits", "Self-Help", 18.99
  row: "TXN029", "2024-10-12 10:40", "The Song of Achilles", "Fantasy", 25.00
end

# Design a function count-high-value that takes a list of transaction amounts and counts how many are above $25. Use for each to iterate through the amounts and build up a count. 

fun count-high-value(trans-amount :: List<Number>) -> Number block: 
  doc: "given a list of transactions it sorts through and returns the number of transactions about $25" 
  var counts = 0 
  for each(amt from trans-amount): 
      when amt > 25: 
        counts := counts + 1
      end 
    end 
    counts 
where: 
count-high-value([list: 18.9, 24.3, 35, 26, 27.9]) is 3 
count-high-value([list: 24]) is 0 
  end 
 
# Ok so in order to complete this question you first have to tell the function that you will be using a variable to complete a singular task over and over. In this case we defined the variable as counts. We used for each to define the iterate through the amounts and repeat the count to build it up. We then told it that when the amt which we defined in for each is greater than 25 that we add plus 1 to the count. 

# Design a function format-transaction-ids that takes a list of transaction IDs and converts them to a "display format" by removing the "TXN" prefix and adding "Order #" at the beginning (e.g., "TXN001" becomes "Order #001"). You may assume that the given list only contains transaction IDs. Use for each to transform each ID.

fun format-transaction-ids(trans-id-list :: List<String>) -> List<String> block: 
  doc: "given a list of transaction-ids it removes the TXN prefix and replaces it with the phrase 'Order #' at the beginning"
  var result = [list: ]
  for each(ID from trans-id-list): 
    digits = string-substring(ID, 3, string-length(ID)) 
    result := result.append([list: "Order #" + digits]) 
end 
result 
where: 
format-transaction-ids([list:]) is [list: ]
format-transaction-ids([list: "TXN001"]) is [list: "Order #001"]
format-transaction-ids([list: "TXN001", "TXN042", "TXN1234"]) is [list: "Order #001", "Order #042", "Order #1234"]
end 