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

    def total_laps
      laps.size
    end
  end
end