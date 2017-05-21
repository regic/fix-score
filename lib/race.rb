class Race
  POINTS = [15, 10, 5, 3, 1].freeze
  BONUS = 1

  def self.score(guesses, winners)
    POINTS.zip(guesses, winners).inject(0) do |memo, (points, guess, winner)|
      memo + if guess == winner && (guess || winner)
        points
      elsif winners.include? guess
        BONUS
      else
        0
      end
    end
  end
end

