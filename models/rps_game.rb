class PlayTypeError < StandardError; end

class RPSGame
  VALID_TYPES = [:rock, :paper, :scissors]
  attr_reader :player_move #, :computer_move

  def initialize(type)
    @player_move = type.to_sym
    # @computer_move = computer_play
    raise PlayTypeError unless VALID_TYPES.include?(player_move)
  end

  def self.valid_play?(type)
    VALID_TYPES.include?(type)
  end

  def computer_play
    VALID_TYPES.sample
  end

  def won?
    case
    when player_move == :rock && computer_play == :scissors then true
    when player_move == :paper && computer_play == :rock then true
    when player_move == :scissors && computer_play == :paper then true
    else false
    end
  end

  def lost?
    case
    when computer_play == :rock && player_move == :scissors then true
    when computer_play == :paper && player_move == :rock then true
    when computer_play == :scissors && player_move == :paper then true
    else false
    end
  end

  def tied?
    lost? || won? ? false : true
  end
end
