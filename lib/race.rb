class Race
  POINTS = [15, 10, 5, 3, 1].freeze
  BONUS = 1

  def self.score(guesses, winners)
    points = 0

    guesses.first(POINTS.length).each_with_index do |guess, index|
      if guess == winners.at(index)
        points += POINTS.at(index)
      elsif winners.include? guess
        points += BONUS
      end
    end

    points
  end
end

