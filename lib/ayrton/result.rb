module Ayrton
  class Result
    attr_reader :racer,
                :laps

    def initialize(racer:, laps:)
      @racer = racer
      @laps = laps
    end

    def total_time
      laps.map(&:duration).inject(&:+)
    end

    def best_lap
      laps.min
    end

    def average_speed
      laps.map(&:average_speed).sum / laps.size
    end

    def total_laps
      laps.size
    end
  end
end