use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")


true 
false 

10 < 20 

fun choose-hat(temp-in-F :: Number) -> String:
  doc: "determines appropriate hat, sun if above 80 need hat, winter hat if below 50" 
    if temp-in-F >= 80: 
    "sun hat" 
  else if temp-in-F < 50: 
      "winter hat"
    else: 
      "no hat"
    end
where:
    choose-hat(50) is "no hat" 
    choose-hat(85) is "sun hat"
    choose-hat(80) is "sun hat"
    choose-hat(49) is "winter hat"
end

# choosing an outfit 
fun add-glasses(outfit :: String) -> String:
  doc: "always adds glasses to an outfit"
  outfit * ", and glasses" 
where: 
  add-glasses("sun hat") is "sun hat, and glasses" 
  add-glasses("no hat") is "no hat, and glasses" 
  add-glasses("winter hat") is "winter hat, and glasses" 
end 
  


