# frozen_string_literal: true

module Factory
  class Base
    def self.for(type)
      services[type]&.new || raise('The given type is not supported!')
    end

    def self.services
      raise NotImplementedError
    end
  end
end
