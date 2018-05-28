module Ayrton
  class Race

    attr_reader :results

    def initialize(results)
      @results = results
    end

    def laps
      @laps ||= results.map(&:laps).flatten
    end

    def racers
      @racers ||= results.map(&:racer)
    end

    def positions
      results.sort_by(&:total_time)
    end

    def best_lap
      results.flat_map(&:laps).min
    end

    def self.from_file(filename)
      results = File.readlines(filename)
                   .select
                   .with_index { |_,i| i != 0 }
                   .map { |l| parse_line(l) }
                   .inject({}) do |h,l| 
                     racer = l[:racer]
                     h[racer] ||= []
                     h[racer] << Lap.new(l.slice(:time, :number, :duration, :average_speed))
                     h
                   end.map do |k,v| 
                     Result.new(racer: k, laps: v)
                   end

      self.new(results)
    end

    REGEX = /^(\d{2}:\d{2}:\d{2}\.\d{3})\s+(\d{3}) – ([A-Z]\.[A-Z]+)\s+(\d+)\s+(\d+:\d+\.\d{3})\s+(\d+,\d+)/.freeze

    def self.parse_line(str)
      REGEX.match(str)

      racer = Racer.new(code: $2,
                        name: $3)
      
      { 
        time: $1,
        racer: racer,
        number: $4.to_i,
        duration: Duration.parse($5),
        average_speed: $6.gsub(',','.').to_f
      }
    end
  end
end