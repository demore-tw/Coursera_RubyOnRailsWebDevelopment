some_var = "false"
another_var = "nil"

case
  when some_var == "pink elephant"
    puts "Don't think about the pink elephant!"
    # string "false" is not equal to string "pink elephant"
  when another_var.nil?
    puts "Question mark in the method name?"
    # string "nil" is not nil
  when some_var == false
    puts "Looks like this one should execute"
    # string is always true, not equal to false
  else
    puts "I guess nothing matched... But why?"
end