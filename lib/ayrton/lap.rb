module Ayrton
  class Lap
    attr_reader :time, 
                :racer, 
                :racer,
                :number,
                :duration,
                :average_speed

    REGEX = /^(\d{2}:\d{2}:\d{2}\.\d{3})\s+(\d{3}) – ([A-Z]\.[A-Z]+)\s+(\d+)\s+(\d+:\d+\.\d{3})\s+(\d+,\d+)/.freeze
    
    def initialize(time:,
                   racer:,
                   number:,
                   duration:,
                   average_speed: )
      
      @time = time
      @racer = racer
      @number = number.to_i
      @duration = duration
      @average_speed = average_speed
    end


    def self.from_line(lap_str)
      REGEX.match(lap_str)

      racer = Racer.new(code: $2,
                        name: $3)
      
      new(time: $1,
          racer: racer,
          number: $4,
          duration: Duration.parse($5),
          average_speed: $6.gsub(',','.').to_f)
    end
  end
end