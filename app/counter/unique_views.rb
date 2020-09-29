# frozen_string_literal: true

module Counter
  class UniqueViews
    def call(logs)
      ips = Hash.new { |hash, key| hash[key] = Set.new }

      logs.each_with_object(Hash.new(0)) do |(url, ip), result|
        unless ips[url].include?(ip)
          result[url] += 1
          ips[url] << ip
        end
      end
    end
  end
end
