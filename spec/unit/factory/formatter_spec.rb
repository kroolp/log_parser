# frozen_string_literal: true

RSpec.describe Factory::Formatter do
  subject { described_class.for(type) }

  context 'when type is equals total_views' do
    let(:type) { 'total_views' }

    it { is_expected.to be_a(Formatter::TotalViews) }
  end

  context 'when type is equals unique_views' do
    let(:type) { 'unique_views' }

    it { is_expected.to be_a(Formatter::UniqueViews) }
  end

  context 'when type is not supported' do
    let(:type) { 'other' }

    it { expect { subject }.to raise_error('The given type is not supported!') }
  end
end
