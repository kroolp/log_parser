# frozen_string_literal: true

module Parser
  class ParsedLogsDecorator
    include Enumerable

    def initialize(log_entries)
      @log_entries = log_entries
    end

    def each(&block)
      log_entries.each do |log_entry|
        url, ip = log_entry.split(' ')

        block.call(url, ip)
      end
    end

    private

    attr_reader :log_entries
  end
end
