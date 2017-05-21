class Race
  POINTS = [15, 10, 5, 3, 1].freeze
  BONUS = 1

  def self.score(guesses, winners)
    points = 0

    POINTS.each_index do |index|
      current_guess = guesses.at(index)
      current_winner = winners.at(index)

      if current_guess == current_winner && (current_guess || current_winner)
        points += POINTS.at(index)
      elsif winners.include? current_guess
        points += BONUS
      end
    end

    points
  end
end

