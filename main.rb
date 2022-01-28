#ask what is the joker piece to calculate gregs_target
puts "Input the number corresponding to the colors of the 'joker' edge piece:"
puts nil

puts "1 = red + blue"
puts "2 = blue + orange"
puts "3 = orange + green"
puts "4 = green + red"
puts nil

target_input = (gets.chomp.to_i) - 1
colors = ["red", "blue", "orange", "green", "red"]



gregs_target = ["joker", "blue", "orange", "green", "red"] #sets the initial values when target is red_blue

target_input.times do #iterates rotations to define starting state of gregs_target
  gregs_target[0], gregs_target[1], gregs_target[2], gregs_target[3], gregs_target[4]  = 
  gregs_target[0], gregs_target[4], gregs_target[1], gregs_target[2], gregs_target[3]
end
# I should be able do define this swaping as a funtion...how?

#print the target to confirm
puts "Your 'joker' piece is the #{colors[target_input]} and #{colors[target_input+1]} edge."
puts nil
puts "With the joker in the back, your target (clockwise from top right) is: #{gregs_target[1]} => #{gregs_target[2]} => #{gregs_target[3]} => #{gregs_target[4]}."
puts nil

puts "Input the color of the yellow edge currently in each position (input 'joker' for joker edge)"
puts nil

puts "back"
#back = gets.chomp
puts "top right"
#top_right = gets.chomp
puts "bottom right"
#bottom_right = gets.chomp
puts "bottom left"
#bottom_left = gets.chomp
puts "top left"
#top_left = gets.chomp
puts nil

#gregs_state = [back, top_right, bottom_right, bottom_left, top_left]

gregs_state = ["green", "joker", "blue", "red", "orange"] #debugging mode
gregs_state_reset = gregs_state
p gregs_state #print wordier

while gregs_state != gregs_target
  move_input = ""
  puts "Enter the input for your move:"
  puts "'tl'    if you want to cycle back => bottom right => top left"
  puts "'tr'    if you want to cycle back => bottom left => top right"
  puts "'reset' if you want to reset to you original position"
  puts nil
  while move_input != "reset"
    puts "Input"
    move_input = gets.chomp
    if move_input == "tl"
      gregs_state[0], gregs_state[2], gregs_state[4]  = 
      gregs_state[2], gregs_state[4], gregs_state[0]
    else
      gregs_state[0], gregs_state[1], gregs_state[3]  = 
      gregs_state[3], gregs_state[0], gregs_state[1]
    end
  puts nil
  puts "State #{gregs_state}"
  puts "Target #{gregs_target}"
  end
  gregs_state = gregs_state_reset
  p "position reset to #{gregs_state}"
end