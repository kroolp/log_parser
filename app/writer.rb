# frozen_string_literal: true

class Writer
  def initialize(output = $stdout)
    @output = output
  end

  def call(text_rows)
    text_rows.map { |text_row| output.puts text_row }
  end

  private

  attr_reader :output
end
