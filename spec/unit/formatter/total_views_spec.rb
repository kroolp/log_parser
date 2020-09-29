# frozen_string_literal: true

RSpec.describe Formatter::TotalViews do
  subject { described_class.new.call(stats) }

  let(:stats) do
    {
      '/about' => 4,
      '/help_page/1' => 2,
      '/home' => 1
    }
  end

  let(:formatted_stats) do
    ['/about 4 visits', '/help_page/1 2 visits', '/home 1 visits']
  end

  it { is_expected.to eq(formatted_stats) }
end
