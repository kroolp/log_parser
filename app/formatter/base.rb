# frozen_string_literal: true

module Formatter
  class Base
    def call(stats)
      stats.map do |url, view_count|
        format(row_format, url: url, view_count: view_count)
      end
    end

    private

    def row_format
      raise NotImplementedError
    end
  end
end
