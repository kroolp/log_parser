# frozen_string_literal: true

class Sorter
  def initialize(direction = nil)
    @direction = direction || 'desc'
  end

  def call(stats)
    value_multiplier = direction == 'asc' ? 1 : -1

    stats.sort_by { |_, value| value * value_multiplier }.to_h
  end

  private

  attr_reader :direction
end
