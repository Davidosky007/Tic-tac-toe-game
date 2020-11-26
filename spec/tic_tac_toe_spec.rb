# spec/tic_tac_toe_spec.rb

require_relative '../lib/board'
require_relative '../lib/player'
require_relative '../lib/game'

describe Board do
  let(:board) { Board.new }
  let(:player1) { Player.new('David', 'X') }
  let(:player2) { Player.new('Oyinda', 'O') }
  let(:active_player) { player1 }

  describe '#initialize' do
    it 'initializes the board' do
      expect(board.board).to eql([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
  end

  describe '#draw?' do
    it 'returns draw if the game is in a tie' do
      board.board = %w[X O X O X O O X O]
      expect(board.draw?).to eql(true)
    end
  end

  describe '#win?' do
    it 'updates board base on the position active player picks' do
      board.board = [1, 2, 3, 'X', 'X', 'X', 7, 8, 9]
      expect(board.win?).to eql(true)
    end
  end

  describe '#update_board' do
    it 'updates board base on the position active player chooses' do
      expect(board.update_board(active_player, 2, player1, player2)).to eql('X')
    end
  end
end

describe Game do
  let(:new_game) { Game.new }
  let(:board) { Board.new }
  let(:player1) { Player.new('David', 'X') }
  let(:player2) { Player.new('Oyinda', 'O') }
  let(:active_player) { player1 }

  describe '#validate_name' do
    it 'checks if a name has been entered' do
      expect(new_game.validate_name('David')).to eql('David')
    end
  end
  describe '#validate_position' do
    it 'checks if the position taken is valid' do
      expect(new_game.validate_position(3, board.board)).to eql(3)
    end
  end

  describe '#game_status' do
    it 'returns false if the game is neither a win nor a draw ' do
      expect(new_game.game_status?(board, active_player)).to eql(false)
    end
  end
end

describe Player do
  let(:player1) { Player.new('David', 'O') }
  let(:player2) { Player.new('Oyinda', 'X') }
  let(:active_player) { player1 }

  describe '#initialize' do
    it 'used to create new player objects' do
      expect(player1.name).to eql('David')
    end
  end

  describe '#switch_player' do
    it 'switches player' do
      expect(player1.switch_player(active_player, player2)).to eql(player2)
    end
  end
end
