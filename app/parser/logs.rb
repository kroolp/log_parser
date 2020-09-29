# frozen_string_literal: true

module Parser
  class Logs
    def initialize(decorator_class = ParsedLogsDecorator)
      @decorator_class = decorator_class
    end

    def call(log_entries)
      decorator_class.new(log_entries)
    end

    private

    attr_reader :decorator_class
  end
end
