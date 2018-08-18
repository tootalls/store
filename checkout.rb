#def addproduct(name, unit_price, in_stock)
#  newitem = name
#  price_of_newitem = unit_price
#  quantity = in_stock
#end

price_of_pineapple = 3
pineapples_instock = 10
price_of_mango = 2
mangoes_instock = 15

username = ARGV.first
prompt = '>'
puts "\aHello, #{username}. Would you like to buy pineapples or mangoes?"
print prompt
item = STDIN.gets.chomp
if item == "pineapples"
  price = price_of_pineapple
elsif item == "mangoes"
  price = price_of_mango
end

puts "#{item} are #{price} dollars each. How many would you like, #{username}?"
print prompt
quantity = STDIN.gets.chomp.to_i

too_many = "Sorry, we only have %{left} %{fruit} left. Is that okay?"

if item == "pineapples" && quantity > pineapples_instock
  puts too_many % {left: pineapples_instock, fruit: "pineapples"}
  print prompt
  STDIN.gets.chomp
  quantity = pineapples_instock
elsif item == "mangoes" && quantity > mangoes_instock
  puts too_many % {left: mangoes_instock, fruit: "mangoes"}
  STDIN.gets.chomp
  quantity = mangoes_instock
end

if item == "pineapples"
  pineapples_instock -= quantity
elsif item == "mangoes"
  mangoes_instock -= quantity
end

total_price = price * quantity

puts "Okay, #{username}, that will be $#{total_price}.00.\nWould you like a receipt?"
print prompt
answer = STDIN.gets.chomp

if answer == "yes"
  puts "Okay, What file should I print it in?"
  print prompt
  filename = STDIN.gets.chomp
  receipt = open(filename, 'w')
  receipt.seek(0)
  receipt.write("Item,Quantity,Price,\n#{item},#{quantity},#{total_price}")
  receipt.close
  print "All done. "
end

puts "\aThank you for your business!"
puts "#{pineapples_instock} pineapples and #{mangoes_instock} mangoes left"
