# frozen_string_literal: true

module Formatter
  class UniqueViews < Base
    private

    def row_format
      '%{url} %{view_count} unique views'
    end
  end
end
