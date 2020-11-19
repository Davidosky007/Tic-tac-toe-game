#!/usr/bin/env ruby

require 'pry'
# VARIABLES
board = [1, 2, 3, 4, 5, 6, 7, 8, 9]

# METHODS
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts '-----------'
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts '-----------'
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def draw?(board)
  board.all? { |i| i.is_a?(String) }
end

def win?(board)
  combinations = [
    [board[0], board[1], board[2]],
    [board[3], board[4], board[5]],
    [board[6], board[7], board[8]],
    [board[0], board[3], board[6]],
    [board[1], board[4], board[7]],
    [board[2], board[5], board[8]],
    [board[0], board[4], board[8]],
    [board[2], board[4], board[6]]
  ]
  combinations.any? do |combo|
    combo.all? { |i| i == 'X' } || combo.all? { |i| i == 'O' }
  end
end

def welcome_title
  puts '************************************************************'
  puts '*                        TIC-TAC-TOE                       *'
  puts '************************************************************'
  puts "      by the Awesome Dev:  David Bassey\n\n"
  puts '                                                 '
  puts '-------------GAME INSTRUCTIONS---------------'
  puts 'The first player takes X and the second player takes O'
  puts 'Choose numbers from 1 to 9 to select desired cell'
  puts 'No duplicate numbers are allowed'
  puts '--------------------------------'
end

def validate_name(name)
  loop do
    break unless name.strip == ''

    print 'Blank can not be used . please enter your name: '
    name = gets.chomp
  end
  name
end

def player_name
  puts 'please enter your name player 1:'
  player1 = gets.chomp
  player1 = validate_name(player1)
  puts 'please enter your name player 2'
  player2 = gets.chomp
  player2 = validate_name(player2)
  [player1, player2]
end

def validate_position(position, board)
  loop do
    break if (1..9).include?(position) && !board[position - 1].is_a?(String)

    puts 'Please enter valid number from 1 to 9' unless (1..9).include?(position)
    puts "it's already taken , Please choose another position: "
    position = gets.chomp.to_i if board[position - 1].is_a?(String)
  end
  position
end

# START GAME INTRO
welcome_title

puts "enter any key to start Tic Tac Toe game, to quit game enter 'q"
answer = gets.chomp.downcase
abort if answer == 'q'

player1, player2 = player_name

puts "#{player1} will be using 'X', while #{player2} will be using 'O'"

# DISPLAY THE LATEST BOARD TO PLAYER
display_board(board)
active_player = player1

loop do
  puts "#{active_player}: which poistion would you like to take?"

  position = gets.chomp.to_i
  position = validate_position(position, board)

  # UPDATE THE BOARD WITH CURRENT PLAYER SYMBOL BASED ON PLAYER'S INPUT
  board[position - 1] = active_player == player1 ? 'X' : 'O'

  # BREAK REPEAT IF
  if win?(board)
    display_board(board)
    puts 'Congratulations!'
    puts "#{active_player} is the winner!"
    break
  elsif draw?(board)
    display_board(board)
    puts 'the game is a tie, try again'
    break
  end

  # DISPLAY UPDATED BOARD
  display_board(board)
  # SWITCH CURRENT PLAYER
  active_player = active_player == player1 ? player2 : player1
end

puts "if you wish to continue playing the game, enter any key. to quit the game press 'q"
answer = gets.chomp.downcase
abort if answer == 'q'
