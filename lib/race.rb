class Race
  POINTS = [15, 10, 5, 3, 1].freeze
  BONUS = 1

  def self.score(guesses, winners)
    POINTS.zip(guesses, winners).inject(0) do |memo, (points, guess, winner)|
      memo + (guess == winner && (guess || winner) ? points : (BONUS if winners.include? guess).to_i)
    end
  end
end

