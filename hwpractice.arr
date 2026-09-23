use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")


lbluet = isosceles-triangle( 300, 30, "solid", "light blue") 
onepr = rotate(90, rectangle( 60, 20, "solid", "light pink"))
twopr = rotate(45, rectangle( 60, 20, "solid", "light pink"))
threepr = rotate(135, rectangle( 60, 20, "solid", "light pink"))
  
redc = circle(12, "solid", "red") 
orangec = circle(12, "solid", "orange") 
bluec = circle(12, "solid", "blue")
yellowc = circle(12, "solid", "yellow") 
purplec = circle(12, "solid", "purple") 

one = overlay-xy(redc, -60, -110, lbluet) 
two = overlay-xy(yellowc, -95, -155, one) 
three = overlay-xy(bluec, -35, -195, two) 
four = overlay-xy(purplec, -12, -250, three) 
five = overlay-xy(orangec, -110, -255, four) 

fiver = overlay-xy(onepr, -67, 60, five) 
fiver2 = overlay-xy(twopr, -67, -4.1, fiver) 
fiver3 = overlay-xy(threepr, -28, -4.1, fiver2) 

sixer 
