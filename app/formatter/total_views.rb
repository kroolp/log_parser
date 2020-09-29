# frozen_string_literal: true

module Formatter
  class TotalViews < Base
    private

    def row_format
      '%{url} %{view_count} visits'
    end
  end
end
