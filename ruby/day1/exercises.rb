#! /usr/bin/ruby

world = 'Hello, world.'
puts world
ruby = 'Hello, Ruby.'
puts world.index('Ruby')
10.times { |i| puts "#{i+1}: Chris Wood" }

puts "Random Number Generator"
puts "Guess a number between 1 and 100!"
num = 1 + rand(100).to_i
guessCount = 0
while input = STDIN.gets do
  guessCount = guessCount + 1
  numGuess = input.to_i()

  if numGuess < 1 || numGuess > 100
    $stderr.puts "Invalid input #{input}.  Please enter a valid number between 1 and 100."
  elsif numGuess == num
    puts "CORRECT!!!! You've guessed the secret number in #{guessCount} guesses!  See if you can do better!"
    break
  elsif numGuess < num
    puts "The number is greater than your guess.  Try guessing a larger number."
  elsif numGuess > num
    puts "The number is less than your guess.  Try guessing a smaller number."
  end
end
