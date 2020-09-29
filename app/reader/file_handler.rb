# frozen_string_literal: true

module Reader
  class FileHandler
    include Enumerable

    def initialize(file_path)
      @file_path = file_path
    end

    def each(&block)
      file = File.open(file_path)

      file.each do |line|
        block.call(line.strip)
      end

      file.close
    end

    private

    attr_reader :file_path
  end
end
