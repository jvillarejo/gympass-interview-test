module Ayrton
  class Race

    attr_reader :laps

    def initialize(laps)
      @laps = laps
    end

    def racers
      @racers ||= laps.map(&:racer).uniq
    end

    def self.from_file(filename)
      laps = File.readlines(filename)
                 .select
                 .with_index { |_,i| i != 0 }
                 .map { |l| Lap.from_line(l) }

      new(laps)
    end
  end
end