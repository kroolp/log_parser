# frozen_string_literal: true

class Pipeline
  def initialize
    @steps = []
  end

  def add_step(step)
    steps << step
  end

  def call(source)
    steps.reduce(source) { |input, step| step.call(input) }
  end

  private

  attr_reader :steps
end
