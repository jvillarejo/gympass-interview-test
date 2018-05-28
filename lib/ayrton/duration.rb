module Ayrton
  class Duration
    include Comparable

    attr_reader :seconds

    def initialize(seconds)
      @seconds = seconds
    end

    def <=>(other)
      seconds <=> other.seconds
    end

    def self.parse(str)
      /(\d+):(\d+\.\d+)/.match(str)

      minutes = $1.to_i
      seconds = $2.to_f

      new((minutes * 60) + seconds)
    end
  end
end