# frozen_string_literal: true

RSpec.describe Sorter do
  subject { described_class.new(direction).call(stats) }

  let(:stats) do
    {
      '/help_page/1' => 2,
      '/contact' => 3,
      '/home' => 1,
      '/about' => 4
    }
  end

  context 'when direction is set to desc' do
    let(:direction) { 'desc' }

    let(:sorted_stats) do
      {
        '/about' => 4,
        '/contact' => 3,
        '/help_page/1' => 2,
        '/home' => 1
      }
    end

    it { is_expected.to eq(sorted_stats) }
  end

  context 'when direction is set to asc' do
    let(:direction) { 'asc' }

    let(:sorted_stats) do
      {
        '/home' => 1,
        '/help_page/1' => 2,
        '/contact' => 3,
        '/about' => 4
      }
    end

    it { is_expected.to eq(sorted_stats) }
  end

  context 'when direction is nil' do
    let(:direction) { nil }

    let(:sorted_stats) do
      {
        '/about' => 4,
        '/contact' => 3,
        '/help_page/1' => 2,
        '/home' => 1
      }
    end

    it { is_expected.to eq(sorted_stats) }
  end
end
