module Ayrton
  class Lap
    attr_reader :time, 
                :number,
                :duration,
                :average_speed

    def initialize(time:,
                   number:,
                   duration:,
                   average_speed: )
      
      @time = time
      @number = number.to_i
      @duration = duration
      @average_speed = average_speed
    end

  end
end