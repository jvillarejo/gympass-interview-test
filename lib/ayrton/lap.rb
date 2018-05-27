module Ayrton
  class Lap
    attr_reader :time, 
                :racer_code, 
                :racer_name,
                :number,
                :duration,
                :average_speed

    REGEX = /^(\d{2}:\d{2}:\d{2}\.\d{3})\s+(\d{3}) – ([A-Z]\.[A-Z]+)\s+(\d+)\s+(\d+:\d+\.\d{3})\s+(\d+,\d{3})/.freeze
    
    def initialize(lap_str)
      REGEX.match(lap_str)

      @time = $1
      @racer_code = $2
      @racer_name = $3
      @number = $4.to_i
      @duration = $5
      @average_speed = $6
    end
  end
end