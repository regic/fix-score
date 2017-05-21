class Race
  POINTS = [15, 10, 5, 3, 1].freeze
  BONUS = 1

  def self.score(guesses, winners)
    max_iterations = [guesses, winners, POINTS].map(&:length).min

    POINTS.first(max_iterations).zip(guesses, winners).inject(0) do |memo, (points, guess, winner)|
      memo + (guess == winner ? points : (BONUS if winners.include? guess).to_i)
    end
  end
end

