# frozen_string_literal: true

module Reader
  class LogFile
    def initialize(file_handler_class = FileHandler)
      @file_handler_class = file_handler_class
    end

    def call(file_path)
      validate_file_extension(file_path)
      validate_file_presence(file_path)

      file_handler_class.new(file_path)
    end

    private

    attr_reader :file_handler_class

    def validate_file_extension(file_path)
      raise 'Unsupported file type.' unless File.extname(file_path) == '.log'
    end

    def validate_file_presence(file_path)
      raise 'There is no file for the given location.' unless File.exist?(file_path)
    end
  end
end
