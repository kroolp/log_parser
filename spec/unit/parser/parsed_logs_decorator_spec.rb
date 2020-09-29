# frozen_string_literal: true

RSpec.describe Parser::ParsedLogsDecorator do
  subject { described_class.new(log_entries) }

  let(:log_entries) do
    [
      '/help_page/1 126.318.035.038',
      '/contact 184.123.665.067',
      '/home 7126.318.035.038'
    ]
  end

  let(:parsed_logs) do
    [
      ['/help_page/1', '126.318.035.038'],
      ['/contact', '184.123.665.067'],
      ['/home', '7126.318.035.038']
    ]
  end

  it { is_expected.to be_a(Enumerable) }
  it { expect(subject.to_a).to eq(parsed_logs) }
end
