#!/usr/bin/env ruby

require 'pry'
board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts '-----------'
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts '-----------'
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def draw_welcome
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
  puts 'Player 1: What is your name?:'
  player_one = gets.chomp
  puts 'Player 2: What is your name?:'
  player_two = gets.chomp
  puts '************************************************************'
  puts "#{player_one} gets to pick X , while #{player_two} gets to pick O"
  puts '************************************************************'
  puts 'Game Start!'
end

p draw_welcome
p display_board(board)
