# frozen_string_literal: true

module Factory
  class Formatter < Base
    def self.services
      {
        'total_views' => ::Formatter::TotalViews,
        'unique_views' => ::Formatter::UniqueViews
      }
    end
  end
end
