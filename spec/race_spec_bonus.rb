require 'spec_helper'
require_relative '../lib/race'

describe Race do

  let(:guesses) { [:joe, :mary, :bob, :sheldon, :howard, :frank] }

  subject { described_class.score(guesses, winners) }

  context "all guesses correct" do
    let(:winners) { guesses.first(described_class::POINTS.length) }

    it "calculates points respectively for correct guesses" do
      expect(subject).to eq described_class::POINTS.first(winners.length).inject(0, :+)
    end
  end

  context "gives no points if all guesses are incorrect" do
    let(:winners) { [:loser] * 2 }

    it { expect(subject).to eq 0 }
  end

  context "gives correct points for first place" do
    let(:winners) { [guesses.at(0)] }

    it { expect(subject).to eq described_class::POINTS.at(0) }
  end

  context "gives correct points for second place" do
    let(:winners) { [:loser, guesses.at(1)] }

    it { expect(subject).to eq described_class::POINTS.at(1) }
  end

  context "gives correct points for third place" do
    let(:winners) { [:loser] * 2 << guesses.at(2) }

    it { expect(subject).to eq described_class::POINTS.at(2) }
  end

  context "gives correct points for fourth place" do
    let(:winners) { [:loser] * 3 << guesses.at(3) }

    it { expect(subject).to eq described_class::POINTS.at(3) }
  end

  context "gives correct points for fifth place" do
    let(:winners) { [:loser] * 4 << guesses.at(4) }

    it { expect(subject).to eq described_class::POINTS.at(4) }
  end

  context "gives bonus points for correct guesses in the wrong places" do
    let(:winners) { [guesses.at(0), :loser, guesses.at(1)].reverse }

    it { expect(subject).to eq described_class::BONUS * 2 }
  end

  context "scores positional and misplaced guesses at the same time" do
    let(:winners) { [:loser] * 2 << guesses.at(2) << guesses.at(0) }

    it { expect(subject).to eq described_class::POINTS.at(2) + described_class::BONUS }
  end

  context "README example" do
    let(:guesses) { [:bob, :mark, :walter] }
    let(:winners) { [:mark, :bob, :walter] }

    it { expect(subject).to eq (2 * described_class::BONUS) + described_class::POINTS.at(2) }
  end
end
