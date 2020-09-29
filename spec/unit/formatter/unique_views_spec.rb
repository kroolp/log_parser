# frozen_string_literal: true

RSpec.describe Formatter::UniqueViews do
  subject { described_class.new.call(stats) }

  let(:stats) do
    {
      '/about' => 5,
      '/contact/1' => 3,
      '/home' => 3
    }
  end

  let(:formatted_stats) do
    ['/about 5 unique views', '/contact/1 3 unique views', '/home 3 unique views']
  end

  it { is_expected.to eq(formatted_stats) }
end
