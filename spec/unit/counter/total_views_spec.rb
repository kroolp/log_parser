# frozen_string_literal: true

RSpec.describe Counter::TotalViews do
  subject { described_class.new.call(logs_entires) }

  let(:logs_entires) do
    [
      ['/help_page/1', '126.318.035.038'],
      ['/contact', '184.123.665.067'],
      ['/home', '184.123.665.067'],
      ['/contact', '444.701.448.104'],
      ['/help_page/1', '126.318.035.038'],
      ['/contact', '929.398.951.889']
    ]
  end

  let(:counted_views) do
    {
      '/help_page/1' => 2,
      '/contact' => 3,
      '/home' => 1
    }
  end

  it 'returns urls with total views counts' do
    is_expected.to match_array(counted_views)
  end
end
