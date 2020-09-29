# frozen_string_literal: true

class Processor
  def initialize(data_type)
    @data_type = data_type
  end

  def call(file_path)
    pipeline.call(file_path)
  end

  private

  attr_reader :data_type

  def pipeline
    @pipeline ||= begin
      pipeline = pipeline_class.new
      step_services.each { |step_service| pipeline.add_step(step_service) }
      pipeline
    end
  end

  def step_services
    [reader, parser, counter, sorter, formatter, writer]
  end

  def pipeline_class
    Pipeline
  end

  def reader
    Reader::LogFile.new
  end

  def parser
    Parser::Logs.new
  end

  def counter
    Factory::Counter.for(data_type)
  end

  def sorter
    Sorter.new
  end

  def formatter
    Factory::Formatter.for(data_type)
  end

  def writer
    Writer.new
  end
end
