module Ayrton
  class Racer
    attr_reader :code, 
                :name

    def initialize(code:,name:)
      @code = code
      @name = name
    end

    def hash
      [code, name].hash
    end

    def eql?(other)
      self == other
    end

    def ==(other)
      return unless other.is_a?(Ayrton::Racer)
      code == other.code
    end
  end
end