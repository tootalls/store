command = ARGV.first
catalog = []
fruit = 0

if command == "add"
  while fruit != ""
    print "name?\n>"
    fruit = STDIN.gets.chomp
    if fruit == ""
      puts "Done"
    else
      print "Price?\n>"
      price = STDIN.gets.chomp.to_f
      print "How many?\n>"
      quantity = STDIN.gets.chomp.to_i
      row = [fruit, price, quantity]
      catalog.push(row)
    end
  end
end

print catalog
