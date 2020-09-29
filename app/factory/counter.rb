# frozen_string_literal: true

module Factory
  class Counter < Base
    def self.services
      {
        'total_views' => ::Counter::TotalViews,
        'unique_views' => ::Counter::UniqueViews
      }
    end
  end
end
