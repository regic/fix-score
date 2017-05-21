class Race
  POINTS = [15, 10, 5, 3, 1].freeze
  BONUS = 1

  def self.score(guesses, winners)
    points = 0

    guesses.first(POINTS.length).each_index do |index|
      if guesses.at(index) == winners.at(index)
        points += POINTS.at(index)
      elsif winners.include? guesses.at(index)
        points += BONUS
      end
    end

    points
  end
end

