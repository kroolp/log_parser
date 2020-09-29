# frozen_string_literal: true

module Counter
  class TotalViews
    def call(logs)
      logs.each_with_object(Hash.new(0)) do |(url, _), result|
        result[url] += 1
      end
    end
  end
end
