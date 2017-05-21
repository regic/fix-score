class Race
  POINTS = [15, 10, 5, 3, 1].freeze
  BONUS = 1

  def self.score(guesses, winners)
    points = 0

    POINTS.zip(guesses, winners) do |score, guess, winner|
      if guess == winner && (guess || winner)
        points += score
      elsif winners.include? guess
        points += BONUS
      end
    end

    points
  end
end

