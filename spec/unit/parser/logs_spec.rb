# frozen_string_literal: true

RSpec.describe Parser::Logs do
  subject { described_class.new.call(log_entries) }

  let(:log_entries) do
    {
      '/about' => 4,
      '/help_page/1' => 2,
      '/home' => 1
    }
  end

  let(:parsed_logs_decorator) { instance_double(Parser::ParsedLogsDecorator) }

  before do
    allow(Parser::ParsedLogsDecorator).to receive(:new).with(log_entries).and_return(parsed_logs_decorator)
  end

  it { is_expected.to eq(parsed_logs_decorator) }
end
