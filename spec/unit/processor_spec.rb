# frozen_string_literal: true

RSpec.describe Processor do
  let(:processor) { described_class.new(data_type) }

  let(:data_type) { 'total_views' }
  let(:file_path) { 'file_path' }

  let(:reader) { instance_double(Reader::LogFile, call: 'output') }
  let(:parser) { instance_double(Parser::Logs, call: 'output') }
  let(:counter) { instance_double(Counter::TotalViews, call: 'output') }
  let(:sorter) { instance_double(Sorter, call: 'output') }
  let(:formatter) { instance_double(Formatter::TotalViews, call: 'output') }
  let(:writer) { instance_double(Writer, call: 'output') }
  let(:pipeline) { instance_double(Pipeline, call: 'output', add_step: nil) }

  before do
    allow(Reader::LogFile).to receive(:new).and_return(reader)
    allow(Parser::Logs).to receive(:new).and_return(parser)
    allow(Factory::Counter).to receive(:for).with(data_type).and_return(counter)
    allow(Sorter).to receive(:new).and_return(sorter)
    allow(Factory::Formatter).to receive(:for).with(data_type).and_return(formatter)
    allow(Writer).to receive(:new).and_return(writer)
    allow(Pipeline).to receive(:new).and_return(pipeline)
  end

  it 'adds services in proper order to pipeline' do
    expect(pipeline).to receive(:add_step).with(reader).ordered
    expect(pipeline).to receive(:add_step).with(parser).ordered
    expect(pipeline).to receive(:add_step).with(counter).ordered
    expect(pipeline).to receive(:add_step).with(sorter).ordered
    expect(pipeline).to receive(:add_step).with(formatter).ordered
    expect(pipeline).to receive(:add_step).with(writer).ordered

    processor.call(file_path)
  end

  it 'calls pipeline with file_path' do
    expect(pipeline).to receive(:call).with(file_path)

    processor.call(file_path)
  end
end
