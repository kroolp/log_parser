# frozen_string_literal: true

RSpec.describe Pipeline do
  let(:pipeline) { described_class.new }

  let(:service_1) { double(:service, call: 'output_1') }
  let(:service_2) { double(:service, call: 'output_2') }

  before do
    pipeline.add_step(service_1)
    pipeline.add_step(service_2)
  end

  it 'calls services in proper order' do
    expect(service_1).to receive(:call).with('input').ordered
    expect(service_2).to receive(:call).with('output_1').ordered

    pipeline.call('input')
  end

  it 'returns value from the last called service' do
    expect(pipeline.call('input')).to eq('output_2')
  end
end
