# frozen_string_literal: true

class Sorter
  ASC = 'asc'
  DESC = 'desc'

  def initialize(direction = nil)
    @direction = direction || DESC
  end

  def call(stats)
    value_multiplier = direction == ASC ? 1 : -1

    stats.sort_by { |_, value| value * value_multiplier }.to_h
  end

  private

  attr_reader :direction
end
